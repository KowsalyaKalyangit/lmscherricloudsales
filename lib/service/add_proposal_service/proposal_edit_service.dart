import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';

import '../../model/Add_proposal/proposal_edit_response.dart';

class ProposalEditService {
  Future proposalEditService({proposalid}) async {
    //  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var proposalid = sharedPreferences.getString(Constants.proposalid);
    
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaleditdata",
        "proposalid":proposalid??''
      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        return ProposalEditModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
