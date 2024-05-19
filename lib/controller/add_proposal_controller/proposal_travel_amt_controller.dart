import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/get_addlistitem_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_edit_controller.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_travel_amt_service.dart';

import '../../model/Add_proposal/proposal_travel_amt_response.dart';
import '../../utils/common_variable.dart';

class ProposalTravelAmtController extends GetxController {
  List<ProposalTravelAmtModel> _proposaltravelamt = [];
  List<ProposalTravelAmtModel> get getproposaltravelamt => _proposaltravelamt;
  RxBool isproposltravelamtLoad = true.obs;
  ProposalTravelAmountService proposalTravelAmountService =
      ProposalTravelAmountService();
      ProposalEditController proposalEditController=Get.put(ProposalEditController());
      GetAddItemListController getAddItemListController=Get.put(GetAddItemListController());
      RxString proposalstopdata=''.obs;
        RxString proposalopendata=''.obs;
  var speeddata;
  Future proposaltravelAmtController({travelid, specid, itemid, typeid,loadid,speedid,operationid,taxid}) async {
    isproposltravelamtLoad(true);
    try {
      var response =
          await proposalTravelAmountService.proposalTravelAmountService(
              travelid: travelid,
              specid: specid,
              itemid: itemid,
              typeid: typeid,
              loadid: loadid,
              speedid: speedid,
              operationid: operationid,
              taxid: taxid
              );
      log(response.toString());
      if (response != null) {
        _proposaltravelamt.clear();
        print('res---------------$response');
        _proposaltravelamt.add(response);
        getAddItemListController.taxamount(_proposaltravelamt.first.data.first.taxamount.toString());
        proposalEditController.stopid(_proposaltravelamt.first.data.first.stop.toString());
          proposalEditController.openid(_proposaltravelamt.first.data.first.opening.toString());
          proposalEditController.subtotal(_proposaltravelamt.first.data.first.subtotal.toString());
           proposalEditController.total(_proposaltravelamt.first.data.first.total.toString());
           proposalEditController.totaltax(_proposaltravelamt.first.data.first.taxamount.toString());
commonVariable.commonapidata.value=_proposaltravelamt[0].data[0].subtotal.toString();
commonVariable.commontotal.value=_proposaltravelamt[0].data[0].total.toString();
 proposalstopdata(_proposaltravelamt.first.data.first.stop.toString());
  proposalopendata(_proposaltravelamt.first.data.first.opening.toString());
        isproposltravelamtLoad(false);
      } else {
        isproposltravelamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
