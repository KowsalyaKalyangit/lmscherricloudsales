import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';
import '../../model/Add_proposal/proposal_control_response.dart';
import '../../model/Add_proposal/proposal_create_response.dart';
import '../../model/Add_proposal/proposal_load_response.dart';
import '../../model/Add_proposal/proposal_update_response.dart';
 

class ProposalUpdateService {
  Future proposalUpdateService(
    { proposalid,leadid,subject,total,subtotal,taxamount,open_till,date,proposal_to,
    country,zip,state,city,address,email,phone,status,currency,liftpriceid,loadid,speedid,
travelid,stopid,openingid,controlid,operationid,machineid,hoistwaysize,carsize,delivery,
erection,power_supply,units,taxid
    
    }
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
       "dashboard":"proposalupdate",
       "proposalid":proposalid??'',
    "leadid":leadid??'',
    "staffid":staffid??'',
    "subject":subject??'',
    "total":total??'',
    "subtotal":subtotal??'',
    "taxamount":taxamount??'',
    
    "open_till":open_till??'',
    "date":date??'',
    "proposal_to":proposal_to??"",
    "country":country??'',
    "zip":zip??'',
    "state":state??'',
    "city":city??'',
    "address":address??"",
    "email":email??'',
    "phone":phone??'',
    "status":status??'',
    "currency":currency??'',
    "liftpriceid":liftpriceid??'',
    "loadid":loadid??'',
    "speedid":speedid??'',
    "travelid":travelid??'',
    "stopid":stopid??'',
    "openingid":openingid??'',
    "controlid":controlid??'',
    "operationid":operationid??'',
    "machineid":machineid??'',
    "hoistwaysize":hoistwaysize??'',
    "carsize":carsize??'',
    "delivery":delivery??"",
    "erection":erection??"",
    "power_supply": power_supply??'',
    "units":units??'',
    "taxid":taxid??''

      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
      //  Fluttertoast.showToast(msg: jsonresponse['EmptyField']);
       Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        return ProposalUpdateModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
