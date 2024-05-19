import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:http/http.dart' as http;

import '../model/map_track_model.dart';

class MapTrackService {
  Future mapTrackService(
      {latitude,longitude, 
      time,flag,logout, 
      }) async {
         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
       "dashboard":"addtemptrack",
"staffid":staffid??'',
   // "staffid":staffid,
    "latitude":latitude??"",
    "longitude":longitude??'',
    "time":time??"",
    "flag":flag??"",
    "logout":logout
     
        
      };
       
      var jsonencode=jsonEncode(data);
      
      log(jsonencode.toString());
print(jsonencode.toString());
      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);
          log('fffffffff');

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        
          
          return MapTrackModel.fromJson(jsonresponse);
        } 
        else {
          log(jsonresponse['message'].toString());
         
          //Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
