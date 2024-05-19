
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/map_time_track_model.dart';
 

import 'package:leadingmanagementsystem/service/get_note_service.dart';
import 'package:leadingmanagementsystem/service/map_start_stop_service.dart';
import 'package:leadingmanagementsystem/service/map_track_time_service.dart';

import '../model/map_start_stop_model.dart';

 

class MapStartStopController extends GetxController{
  List<MapStartStopModel> _mapstartstop=[];
  List<MapStartStopModel> get getmapstartstop=>_mapstartstop;
   RxBool isMaptStartStopLoad = true.obs;
   MapStartStopService mapStartStopService=MapStartStopService();
  Future mapStartStopController() async {
    isMaptStartStopLoad(true);
    try {
      var response = await mapStartStopService.mapStartStopService();
      log(response.toString());
      if (response != null) {
        _mapstartstop.clear();
        print('res---------------$response');
        _mapstartstop.add(response);
       
           
      
        isMaptStartStopLoad(false);
         //Get.back();
        
         
      } else {
        isMaptStartStopLoad(false);
        //Get.back(); 
      }
    } catch (e) {
      rethrow;
    }
  }
}