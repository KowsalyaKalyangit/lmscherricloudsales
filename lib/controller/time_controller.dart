import 'package:geolocator/geolocator.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/map_service.dart';
import 'package:location/location.dart';


class TimerController extends GetxController {

Location location = Location();
LocationData? currentLocation;

 Timer? timer;
 RxBool isloading=true.obs;
    onstartfunc() {
   
   
    
      timer = Timer.periodic(const Duration(seconds: 5), (Timer t)async {
        bool _bgModeEnabled = await location.isBackgroundModeEnabled();
         
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, show a dialog to enable location services
    return;
  }

  // Request permission to access the device's location
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    // Permission denied, show a dialog to explain why you need access to the location
    return;
  }

  // Get the current position
   

  // Extract latitude and longitude
  
  
   currentLocation = await location.getLocation();
   timer= await MapTrackService().mapTrackService(
          latitude: currentLocation!.latitude.toString(),
          longitude: currentLocation!.longitude.toString(),
          time: 'time',
          flag: 'address',
          logout: 'start');
           
   });
       

   
      isloading(false);

    }
   
 



 
    onstopfunc() {
    print('I am disposed');
    isloading(false);
    // Get.delete<TimerController>();
    timer!.cancel();
  

  }
  Future<bool> enableBackgroundMode() async {
bool _bgModeEnabled = await location.isBackgroundModeEnabled();
if (_bgModeEnabled) {
  return true;
} else {
  try {
    await location.enableBackgroundMode();
  } catch (e) {
    debugPrint(e.toString());
  }
  try {
    _bgModeEnabled = await location.enableBackgroundMode();
  } catch (e) {
    debugPrint(e.toString());
  }
  print(_bgModeEnabled); //True!
  return _bgModeEnabled;
 }
}
}
   

  

