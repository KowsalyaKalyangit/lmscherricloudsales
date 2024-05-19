
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_delivery_response.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_erection_response.dart';
 
import '../../service/add_proposal_service/proposal_erectiin_service.dart';
 
 
class ProposalErectionController extends GetxController{
   
//dropdown
 List<ProposalErectionModel> _proposalerection = [];
  List<ProposalErectionModel> get getproposalerection => _proposalerection;
  RxBool isproposaerectionLoad = true.obs;
  ProposalErectionService proposalErectionService =
      ProposalErectionService();

   

  //dropdown click event
 Future proposalErectionController() async {
   //isproposaerectionLoad(true);
    try {
      var response = await proposalErectionService.proposalErectionService();
      log(response.toString());
      if (response != null) {
        _proposalerection.clear();
        
        _proposalerection.add(response);
        log(response);
       
           
      
        isproposaerectionLoad(false);
        
         
      } else {
        isproposaerectionLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}