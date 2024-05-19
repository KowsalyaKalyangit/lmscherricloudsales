import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_travel_amt_controller.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_stop_service.dart';

import '../../model/Add_proposal/proposal_stop_response.dart';
import '../../model/Add_proposal/proposal_travel_response.dart';

import '../../service/add_proposal_service/proposal_travel_service.dart';

class ProposalStopController extends GetxController {
  List<ProposalStopModel> _proposalstop = [];
  List<ProposalStopModel> get getproposalStop => _proposalstop;
  RxBool isproposalStopLoad = true.obs;
  ProposalStopService proposalStopService = ProposalStopService();
  ProposalTravelAmtController proposalTravelAmtController=Get.put(ProposalTravelAmtController());
     RxString proposalstopdata=''.obs;
        RxString proposalopendata=''.obs;
  Future proposalStopController() async {
    isproposalStopLoad(true);
    try {
      var response = await proposalStopService.proposalStopService();
      log(response.toString());
      if (response != null) {
        _proposalstop.clear();
        print('res---------------$response');
        _proposalstop.add(response);
// proposalTravelAmtController.proposalstopdata(_proposalstop.first.data.first.stopid.toString());
        isproposalStopLoad(false);
      } else {
        isproposalStopLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
