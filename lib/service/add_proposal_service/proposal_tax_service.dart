import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';

 
import '../../model/Add_proposal/proposal_tax_response.dart';
 

class ProposalTaxService {
  Future proposalTaxService({taxid,subtotal,total}) async {
    
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getproposaltaxvalue",
        "taxid": taxid??'',
         
        "subtotal": subtotal??'',
        "total": total??''
      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        //Fluttertoast.showToast(msg: jsonresponse['message']);
        return ProposalTaskModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
