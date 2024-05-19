import 'dart:async';
import 'dart:developer';
import 'dart:io';
 
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/view/home/map.dart';
import 'package:location/location.dart';



final FlutterLocalNotificationsPlugin flutterLocalPlugin =FlutterLocalNotificationsPlugin();
const AndroidNotificationChannel notificationChannel=AndroidNotificationChannel(
    "coding is life foreground",
    "coding is life foreground service",
    description: "This is channel des....",
  importance: Importance.high
);


 

Future<void> initservice()async{
  var service=FlutterBackgroundService();
  //set for ios
  if(Platform.isIOS){
    await flutterLocalPlugin.initialize(const InitializationSettings(
      iOS: DarwinInitializationSettings()
    ));
  }

  await flutterLocalPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(notificationChannel);

  //service init and start
  await service.configure(
      iosConfiguration: IosConfiguration(
        onBackground: iosBackground,
        onForeground: onStart,
        autoStart: true,
      ),
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: false,
        isForegroundMode: true,
        notificationChannelId: "coding is life",//comment this line if show white screen and app crash
        initialNotificationTitle: "Coding is life",
        initialNotificationContent: "Awsome Content",
        foregroundServiceNotificationId: 90
      )
  );
  service.startService();

  //for ios enable background fetch from add capability inside background mode

}

//onstart method
@pragma("vm:entry-point")
void onStart(ServiceInstance service){
  DartPluginRegistrant.ensureInitialized();

  service.on("setAsForeground").listen((event) {
   
    print("foreground ===============");
  });

  service.on("setAsBackground").listen((event) {
    print("background ===============");
  });

  service.on("stopService").listen((event) {
    service.stopSelf();
  });

  //display notification as service
  Timer.periodic(Duration(seconds: 2), (timer)async {
    Location location = new Location();
      var userLocation = await location.getLocation();
       String convertedDateTimestop =
                          "${now.year.toString()}:${now.month.toString().padLeft(2, '0')}:${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
 MapTrackService().mapTrackService(
          latitude: userLocation.latitude.toString(),
          longitude:userLocation.longitude.toString(),
          time: convertedDateTimestop.toString(),
          flag: 'address',
          logout: 'start');
   
     });
   
  print("Background service ${DateTime.now()}") ;

}

//iosbackground
@pragma("vm:entry-point")
Future<bool> iosBackground(ServiceInstance service)async{
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  log('ios backhroind');
  return true;
}

 

class IosPage extends StatefulWidget {
  const IosPage({super.key});

  @override
  State<IosPage> createState() => _IosPageState();
}

class _IosPageState extends State<IosPage> {
   @override
  Widget build(BuildContext context) {return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        title: Text(''),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //layout
            SizedBox(height: 200,),
            ElevatedButton(onPressed: (){
              FlutterBackgroundService().invoke("stopService");
            }, child: Text("stop service")),
            ElevatedButton(onPressed: (){
              initservice();
              FlutterBackgroundService().startService();
            }, child: Text("start service")),
          ],
        ),
      ),

    );
  }
}