import 'dart:developer';
import 'dart:io';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_tax_controller.dart';
import 'package:leadingmanagementsystem/service/background_service.dart';
import 'package:leadingmanagementsystem/service/ios_background_service.dart';

import 'package:leadingmanagementsystem/utils/routes.dart';
import 'package:leadingmanagementsystem/view/splash_screen.dart';

import 'package:permission_handler/permission_handler.dart';

import 'controller/add_proposal_controller/get_tax_controller.dart';
import 'view/home/final_ios.dart';
import 'view/ios_location.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  //await initservice();

  await Permission.microphone.request();
  await Permission.storage.request();

  runApp(const MyApp());
}

String? token;
checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.token);
  log('tokeen');
  log(token.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('tokennnnn----${token}');

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent,
          ),
          splashColor: Colors.transparent,
          textTheme: GoogleFonts.jostTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, // transparent status bar
            systemNavigationBarColor: Colors.black, // navigation bar color
            statusBarIconBrightness: Brightness.dark, // status bar icons' color
            systemNavigationBarIconBrightness:
                Brightness.dark, //navigation bar icons' color
          ),
          child:SplashScreen(),
        ));
  }
}

class MultiSelectDropdown extends StatefulWidget {
  const MultiSelectDropdown({super.key});

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  var selectedOptions = [];
  var listitem;
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  ProposalTaxDrpDwnController proposalTaxController =
      Get.put(ProposalTaxDrpDwnController());
  @override
  void initState() {
    proposalTaxController.proposaltaxdrpdwnController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (proposalTaxController.istaxdrpdwnLoad.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (proposalTaxController.gettaxdrpdwn.isEmpty) {
          return const Center(
            child: Text('No data Found'),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(child: Text(listitem.toString())),
                  Container(
                    height: 10.0.hp,
                    width: 40.0.wp,
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      hint: const Text('Select Options'),
                      value: selectedOptions.isEmpty ? null : selectedOptions,
                      onChanged: (value) {
                        setState(() {
                          selectedOptions = value as List;
                        });
                      },
                      items: proposalTaxController.gettaxdrpdwn[0].data.isEmpty
                          ? []
                          : proposalTaxController.gettaxdrpdwn[0].data
                              .map((option) {
                              return DropdownMenuItem(
                                value: option,
                                child: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setstate) {
                                  return CheckboxListTile(
                                    title: Text(option.name),
                                    value: option.bval,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        var item = proposalTaxController
                                            .gettaxdrpdwn[0].data
                                            .indexOf(option);
                                        print(item);

                                        proposalTaxController.gettaxdrpdwn[0]
                                            .data[item].bval = value ?? false;
                                        print(proposalTaxController
                                            .gettaxdrpdwn[0].data[item].bval);

                                        if (item == 0) {
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[0].bval = true;
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[1].bval = true;
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[2].bval = false;
                                          listitem =
                                              '${proposalTaxController.gettaxdrpdwn[0].data[0].name} ${proposalTaxController.gettaxdrpdwn[0].data[1].name}';
                                        }
                                        if (item == 1) {
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[1].bval = true;
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[0].bval = true;
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[2].bval = false;
                                          listitem =
                                              '${proposalTaxController.gettaxdrpdwn[0].data[0].name} ${proposalTaxController.gettaxdrpdwn[0].data[1].name}';
                                        }
                                        if (item == 2) {
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[0].bval = false;
                                          proposalTaxController.gettaxdrpdwn[0]
                                              .data[1].bval = false;
                                          listitem =
                                              '${proposalTaxController.gettaxdrpdwn[0].data[2].name}';
                                        }
                                      });
                                    },
                                  );
                                }),
                              );
                            }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        }
      }),
    );
  }
}




// //  import 'dart:async';
// // import 'dart:io';
// // import 'dart:ui';

// // import 'package:device_info_plus/device_info_plus.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_background_service/flutter_background_service.dart';
// // import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await initializeService();
// //   runApp(const MyApp());
// // }

// // Future<void> initializeService() async {
// //   final service = FlutterBackgroundService();

// //   /// OPTIONAL, using custom notification channel id
// //   const AndroidNotificationChannel channel = AndroidNotificationChannel(
// //     'my_foreground', // id
// //     'MY FOREGROUND SERVICE', // title
// //     description:
// //         'This channel is used for important notifications.', // description
// //     importance: Importance.low, // importance must be at low or higher level
// //   );

// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   if (Platform.isIOS || Platform.isAndroid) {
// //     await flutterLocalNotificationsPlugin.initialize(
// //       const InitializationSettings(
// //         iOS: DarwinInitializationSettings(),
// //         android: AndroidInitializationSettings('ic_bg_service_small'),
// //       ),
// //     );
// //   }

// //   await flutterLocalNotificationsPlugin
// //       .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin>()
// //       ?.createNotificationChannel(channel);

// //   await service.configure(
// //     androidConfiguration: AndroidConfiguration(
// //       // this will be executed when app is in foreground or background in separated isolate
// //       onStart: onStart,

// //       // auto start service
// //       autoStart: true,
// //       isForegroundMode: true,

// //       notificationChannelId: 'my_foreground',
// //       initialNotificationTitle: 'AWESOME SERVICE',
// //       initialNotificationContent: 'Initializing',
// //       foregroundServiceNotificationId: 888,
// //     ),
// //     iosConfiguration: IosConfiguration(
// //       // auto start service
// //       autoStart: true,

// //       // this will be executed when app is in foreground in separated isolate
// //       onForeground: onStart,

// //       // you have to enable background fetch capability on xcode project
// //       onBackground: onIosBackground,
// //     ),
// //   );
// // }

// // // to ensure this is executed
// // // run app from xcode, then from xcode menu, select Simulate Background Fetch

// // @pragma('vm:entry-point')
// // Future<bool> onIosBackground(ServiceInstance service) async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   DartPluginRegistrant.ensureInitialized();

// //   SharedPreferences preferences = await SharedPreferences.getInstance();
// //   await preferences.reload();
// //   final log = preferences.getStringList('log') ?? <String>[];
// //   log.add(DateTime.now().toIso8601String());
// //   await preferences.setStringList('log', log);

// //   return true;
// // }

// // @pragma('vm:entry-point')
// // void onStart(ServiceInstance service) async {
// //   // Only available for flutter 3.0.0 and later
// //   DartPluginRegistrant.ensureInitialized();

// //   // For flutter prior to version 3.0.0
// //   // We have to register the plugin manually

// //   SharedPreferences preferences = await SharedPreferences.getInstance();
// //   await preferences.setString("hello", "world");

 

// //   if (service is AndroidServiceInstance) {
// //     service.on('setAsForeground').listen((event) {
// //       service.setAsForegroundService();
// //     });

// //     service.on('setAsBackground').listen((event) {
// //       service.setAsBackgroundService();
// //     });
// //   }

// //   service.on('stopService').listen((event) {
// //     service.stopSelf();
// //   });

// //   // bring to foreground
// //   Timer.periodic(const Duration(seconds: 1), (timer) async {
// //     if (service is AndroidServiceInstance) {
// //       if (await service.isForegroundService()) {
// //         /// OPTIONAL for use custom notification
// //         /// the notification id must be equals with AndroidConfiguration when you call configure() method.
         

// //         // if you don't using custom notification, uncomment this
// //         service.setForegroundNotificationInfo(
// //           title: "My App Service",
// //           content: "Updated at ${DateTime.now()}",
// //         );
// //       }
// //     }

// //     /// you can see this log in logcat
// //     print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

// //     // test using external plugin
// //     final deviceInfo = DeviceInfoPlugin();
// //     String? device;
// //     if (Platform.isAndroid) {
// //       final androidInfo = await deviceInfo.androidInfo;
// //       device = androidInfo.model;
// //     }

// //     if (Platform.isIOS) {
// //       final iosInfo = await deviceInfo.iosInfo;
// //       device = iosInfo.model;
// //     }

// //     service.invoke(
// //       'update',
// //       {
// //         "current_date": DateTime.now().toIso8601String(),
// //         "device": device,
// //       },
// //     );
// //   });
// // }

// // class MyApp extends StatefulWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   String text = "Stop Service";
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Service App'),
// //         ),
// //         body: Column(
// //           children: [
// //             StreamBuilder<Map<String, dynamic>?>(
// //               stream: FlutterBackgroundService().on('update'),
// //               builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                   return const Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 }

// //                 final data = snapshot.data!;
// //                 String? device = data["device"];
// //                 DateTime? date = DateTime.tryParse(data["current_date"]);
// //                 return Column(
// //                   children: [
// //                     Text(device ?? 'Unknown'),
// //                     Text(date.toString()),
// //                   ],
// //                 );
// //               },
// //             ),
// //             ElevatedButton(
// //               child: const Text("Foreground Mode"),
// //               onPressed: () {
// //                 FlutterBackgroundService().invoke("setAsForeground");
// //               },
// //             ),
// //             ElevatedButton(
// //               child: const Text("Background Mode"),
// //               onPressed: () {
// //                 FlutterBackgroundService().invoke("setAsBackground");
// //               },
// //             ),
// //             ElevatedButton(
// //               child: Text(text),
// //               onPressed: () async {
// //                 final service = FlutterBackgroundService();
// //                 var isRunning = await service.isRunning();
// //                 if (isRunning) {
// //                   service.invoke("stopService");
// //                 } else {
// //                   service.startService();
// //                 }

// //                 if (!isRunning) {
// //                   text = 'Stop Service';
// //                 } else {
// //                   text = 'Start Service';
// //                 }
// //                 setState(() {});
// //               },
// //             ),
// //             const Expanded(
// //               child: LogView(),
// //             ),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {},
// //           child: const Icon(Icons.play_arrow),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class LogView extends StatefulWidget {
// //   const LogView({Key? key}) : super(key: key);

// //   @override
// //   State<LogView> createState() => _LogViewState();
// // }

// // class _LogViewState extends State<LogView> {
// //   late final Timer timer;
// //   List<String> logs = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
// //       final SharedPreferences sp = await SharedPreferences.getInstance();
// //       await sp.reload();
// //       logs = sp.getStringList('log') ?? [];
// //       if (mounted) {
// //         setState(() {});
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     timer.cancel();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: logs.length,
// //       itemBuilder: (context, index) {
// //         final log = logs.elementAt(index);
// //         return Text(log);
// //       },
// //     );
// //   }
// // }

 


 
