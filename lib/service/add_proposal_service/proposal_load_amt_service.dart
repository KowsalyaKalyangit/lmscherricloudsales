import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';

import '../../model/Add_proposal/proposal_load_amt_response.dart';
 

class ProposalLoadAmountService {
  Future proposalLoadAmountService({loadid,itemid,typeid,specid,speedid,travelid,operationid,taxid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposalloadvalue",
        "loadid": loadid??'',
        "itemid": itemid??'',
        "typeid": typeid??'',
        "specid":specid??'',
        "speedid":speedid??'',
        "travelid":travelid??'',
        "operationid":operationid??'',
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
        Fluttertoast.showToast(msg: jsonresponse['message']);
        return ProposalLoadAmtModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
