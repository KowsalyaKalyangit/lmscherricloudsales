
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/get_addlistitem_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_edit_controller.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_load_amt_response.dart';
import '../../model/Add_proposal/proposal_load_response.dart';
import '../../service/add_proposal_service/proposal_load_amt_service.dart';
import '../../utils/common_variable.dart';
 
class ProposalLoadController extends GetxController{
  List<ProposalLoadModel> _proposalLoad=[];
  List<ProposalLoadModel> get getproposalloadlist=>_proposalLoad;
   RxBool isproposaLoad = true.obs;
   ProposalLoadService proposalLoadService=ProposalLoadService();
//dropdown
 List<ProposalLoadAmtModel> _proposalLoadamt = [];
  List<ProposalLoadAmtModel> get getproposalloadamt => _proposalLoadamt;
  RxBool isproposaLoadamtLoad = true.obs;
  ProposalLoadAmountService proposalLoadAmountService =
      ProposalLoadAmountService();
      ProposalEditController proposalEditController=Get.put(ProposalEditController());
      GetAddItemListController getAddItemListController=Get.put(GetAddItemListController());

  Future proposalloadController() async {
    isproposaLoad(true);
    try {
      var response = await proposalLoadService.proposalLoadService();
      log(response.toString());
      if (response != null) {
        _proposalLoad.clear();
        print('res---------------$response');
        _proposalLoad.add(response);
        log(response);
       
           
      
        isproposaLoad(false);
        
         
      } else {
        isproposaLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  //dropdown click event
  Future proposalLoadAmtController({loadid,itemid,typeid,specid,speedid,travelid,operationid,taxid}) async {
    isproposaLoadamtLoad(true);
    try {
      var response = await proposalLoadAmountService.proposalLoadAmountService(
          loadid: loadid, itemid: itemid, typeid: typeid,specid: specid,travelid: travelid,operationid: operationid,taxid:taxid,speedid: speedid);
      log(response.toString());
      if (response != null) {
        _proposalLoadamt.clear();
        print('res---------------$response');
        _proposalLoadamt.add(response);
        getAddItemListController.taxamount(_proposalLoadamt.first.data.first.taxamount.toString());
        proposalEditController.totaltax(_proposalLoadamt.first.data.first.taxamount.toString());
        proposalEditController.subtotal(_proposalLoadamt.first.data.first.subtotal.toString());
                proposalEditController.total(_proposalLoadamt.first.data.first.total.toString());
        commonVariable.commonapidata.value=_proposalLoadamt[0].data[0].subtotal.toString();
         commonVariable.commontotal.value=_proposalLoadamt[0].data[0].total.toString();
log('kkkkk-----${_proposalLoadamt[0].data[0].subtotal.toString()}');
        isproposaLoadamtLoad(false);
      } else {
        isproposaLoadamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}