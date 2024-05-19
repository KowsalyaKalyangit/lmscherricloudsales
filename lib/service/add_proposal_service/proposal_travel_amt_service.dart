import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../allpackages.dart';
import '../../model/Add_proposal/proposal_travel_amt_response.dart';

class ProposalTravelAmountService {
  Future proposalTravelAmountService(
      {travelid, specid, itemid, typeid,loadid,speedid,operationid,taxid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaltravelvalue",
        "travelid": travelid ?? '',
        "specid": specid ?? '',
        "itemid": itemid ?? '',
        "typeid": typeid ?? '',
        "loadid":loadid??'',
        "speedid":speedid??'',
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
        // Fluttertoast.showToast(msg: jsonresponse['message']);
        return ProposalTravelAmtModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
