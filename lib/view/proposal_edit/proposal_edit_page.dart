import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getwidget/getwidget.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/get_proposal_related_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_edit_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_load_controller.dart';

import '../../controller/add_leads_controller.dart';
import '../../controller/add_proposal_controller/proposal_currency_controller.dart';
import '../../controller/add_proposal_controller/proposal_discount_controller.dart';
import '../../controller/add_proposal_controller/proposal_status_controller.dart';
import '../../controller/add_proposal_controller/related_proposal_controller.dart';
import '../../utils/signup_button.dart';
import '../../utils/textstyles.dart';

import 'proposal_edit_nextpage.dart';

class ProposalEditPage extends StatefulWidget {
  const ProposalEditPage({super.key, this.proposalid, this.leadid});
  final String? proposalid;
  final String? leadid;

  @override
  State<ProposalEditPage> createState() => _ProposalEditPageState();
}

class _ProposalEditPageState extends State<ProposalEditPage> {
  var typeindex;
  var countryname;

  var status;
  var proposaltype;
  var proposalload;
  var related;
  var relateditem;
  var currency;
  var discount;
  ProposalEditController proposalEditController =
      Get.put(ProposalEditController());
  AddAssignDetailsController addAssignDetailsController =
      Get.put(AddAssignDetailsController());
  ProposalRelatedController proposalRelatedController =
      Get.put(ProposalRelatedController());
  GetProposalRelatedController getProposalRelatedController =
      Get.put(GetProposalRelatedController());
  ProposalStatusController proposalStatusController =
      Get.put(ProposalStatusController());
  ProposalCurrencyController proposalCurrencyController =
      Get.put(ProposalCurrencyController());
  ProposalDiscountController proposalDiscountController =
      Get.put(ProposalDiscountController());
  ProposalLoadController proposalLoadController =
      Get.put(ProposalLoadController());

  @override
  void initState() {
    func();

    super.initState();
  }

  func() {
    proposalEditController.proposalEditController(proposalid: widget.proposalid.toString());

    setState(() {
       addAssignDetailsController.getCountry();
    });

    proposalLoadController.proposalloadController() ;

    proposalRelatedController.proposalrelatedController().then(
      (value) {
        relateditem =
            proposalRelatedController.getleadstypeDetails[0].data[0].value;
      },
    );
    setState(() {
       proposalStatusController.proposalStatusController() ;
    });
   

    proposalCurrencyController.proposalCurrencyController().then((value) {
      currency = proposalCurrencyController.getproposalCurrency[0].data[0].id;
    });
    proposalDiscountController.proposalDiscountController().then((value) {
      discount =
          proposalDiscountController.getproposalCurrency[0].data[0].value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: screenbackground,
            ),
          ),
          backgroundColor: appcolor,
          title: Text(
            'Edit Proposal',
            style: toptitleStyle,
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: logocolor,
        //   onPressed: (){
        //     Get.to(AddProposalPage());
        //   },child: Icon(Icons.add),),
        backgroundColor: screenbackground,
        body: Obx(() {
          if (proposalEditController.isproposalEditLoad.value ||
              addAssignDetailsController.isCountryLoading.value ||
              proposalStatusController.isproposalstatusLoad.value ||
              proposalDiscountController.isproposalDiscountLoad.value ||
              proposalRelatedController.isproposalreletadLoad.value ||
              proposalCurrencyController.isproposalCurrencyLoad.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (proposalEditController.getproposalEdit.isEmpty ||
              addAssignDetailsController.getprofileUpdatecountry.isEmpty ||
              proposalStatusController.getproposalstatus.isEmpty ||
              proposalDiscountController.getproposalCurrency.isEmpty ||
              proposalRelatedController.getleadstypeDetails.isEmpty ||
              proposalCurrencyController.getproposalCurrency.isEmpty) {
            return Center(
              child: Text('No data Found'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Subject*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 7.00.hp, width: 100.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: proposalEditController.subject,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: '',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    Text(
                      'Related*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 7.00.hp,
                            width: 86.00.wp,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xFFECE9E9),
                                width:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: relateditem,
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: forminputcolor,
                                        fontWeight: FontWeight.w500)),
                                hint: Text(relateditem.toString(),
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: formhintcolor,
                                            fontWeight: FontWeight.w500))),
                                onChanged: (newValue) {
                                  setState(() {
                                    if (newValue != null) {
                                      setState(() {
                                        relateditem = newValue.toString();
                                        print('newwvalue');
                                        print(newValue.toString());
                                      });
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: const Color(0xFF737070),
                                ),
                                items: proposalRelatedController
                                        .getleadstypeDetails[0].data.isEmpty
                                    ? []
                                    : proposalRelatedController
                                        .getleadstypeDetails[0].data
                                        .map<DropdownMenuItem<String>>((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.value.toString(),
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 0, right: 4),
                                              child: Text(value.name.toString(),
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          fontSize: 10.00.sp,
                                                          color: forminputcolor,
                                                          fontWeight: FontWeight
                                                              .w500)))),
                                        );
                                      }).toList(),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Lead*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 7.00.hp, width: 100.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: proposalEditController.leadname,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: '',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.wp,
                    ),
                    Text(
                      'To*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 7.00.hp, width: 100.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: proposalEditController.toname,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: '',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.wp,
                    ),
                    Text(
                      'Address',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 9.00.hp, width: 100.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        maxLines: 6,
                        controller: proposalEditController.address,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: ' ',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      children: [
                        Text(
                          'State',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 40.0.wp,
                        ),
                        Text(
                          'City',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 7.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: proposalEditController.city,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
                                      width: 1),
                                ),
                                fillColor: const Color(0xffC6C6C6),
                                hintText: ' ',
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500)),
                                border: const OutlineInputBorder(
                                  gapPadding: 4,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.hp,
                        ),
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 7.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: proposalEditController.state,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
                                      width: 1),
                                ),
                                fillColor: const Color(0xffC6C6C6),
                                hintText: '',
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500)),
                                border: const OutlineInputBorder(
                                  gapPadding: 4,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Country',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                        height: 6.00.hp,
                        width: 90.00.wp,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: const Color(0xFFECE9E9),
                            width: MediaQuery.of(context).size.height * 0.001,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: proposalEditController.country.value,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            hint: Text('country',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500))),
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue != null) {
                                  setState(() {
                                    proposalEditController.country.value = newValue.toString();
                                    print('newwvalue');
                                    print(newValue.toString());
                                  });
                                }
                              });
                            },
                            icon: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: const Color(0xFF737070),
                            ),
                            items: addAssignDetailsController
                                    .getprofileUpdatecountry[0].data.isEmpty
                                ? []
                                : addAssignDetailsController
                                    .getprofileUpdatecountry[0].data
                                    .map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.countryId.toString(),
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 4),
                                          child: Text(
                                              value.countryName.toString(),
                                              style: GoogleFonts.jost(
                                                  textStyle: TextStyle(
                                                      fontSize: 10.00.sp,
                                                      color: forminputcolor,
                                                      fontWeight:
                                                          FontWeight.w500)))),
                                    );
                                  }).toList(),
                          ),
                        )),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 34.0.wp,
                        ),
                        Text(
                          'Zip Code',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 6.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: proposalEditController.phone,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
                                      width: 1),
                                ),
                                fillColor: const Color(0xffC6C6C6),
                                hintText: '',
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500)),
                                border: const OutlineInputBorder(
                                  gapPadding: 4,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.hp,
                        ),
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 6.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: proposalEditController.zip,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
                                      width: 1),
                                ),
                                fillColor: const Color(0xffC6C6C6),
                                hintText: '',
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500)),
                                border: const OutlineInputBorder(
                                  gapPadding: 4,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Date*',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 34.0.wp,
                        ),
                        Text(
                          'Open Till',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 6.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: proposalEditController.date,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
                                      width: 1),
                                ),
                                fillColor: const Color(0xffC6C6C6),
                                hintText: '',
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500)),
                                border: const OutlineInputBorder(
                                  gapPadding: 4,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 2.0.hp,
                        ),
                        Container(
                          color: const Color(0xffD9D9D9).withOpacity(0.1),
                          height: 6.00.hp, width: 40.00.wp,
                          // padding: const EdgeInsets.only(
                          //   left: 20,
                          //   right: 20,
                          // ),
                          child: TextFormField(
                            controller: proposalEditController.oepntill,
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: forminputcolor,
                                    fontWeight: FontWeight.w500)),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      color: appcolor, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                      color: const Color(0xffC6C6C6)
                                          .withOpacity(0.5),
                                      width: 1),
                                ),
                                fillColor: const Color(0xffC6C6C6),
                                hintText: '',
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                        fontSize: 10.00.sp,
                                        color: formhintcolor,
                                        fontWeight: FontWeight.w500)),
                                border: const OutlineInputBorder(
                                  gapPadding: 4,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Status',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 7.00.hp,
                              width: 40.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: proposalEditController.statusid.value.isEmpty?null: proposalEditController.statusid.value,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: forminputcolor,
                                          fontWeight: FontWeight.w500)),
                                  hint: Text('status',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500))),
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                           proposalEditController.statusid.value = newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: proposalStatusController
                                          .getproposalstatus[0].data.isEmpty
                                      ? []
                                      : proposalStatusController
                                          .getproposalstatus[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.value.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    value.name.toString(),
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
                                                            color:
                                                                forminputcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)))),
                                          );
                                        }).toList(),
                                ),
                              )),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Email*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 6.00.hp, width: 85.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: proposalEditController.tomail,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: '',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                      children: [
                        Text(
                          'Currency*',
                          style: listtitlefont,
                        ),
                        SizedBox(
                          width: 34.0.wp,
                        ),
                        Text(
                          'Discount Type',
                          style: listtitlefont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 7.00.hp,
                                  width: 40.00.wp,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: teal1.withOpacity(0.1),
                                    border: Border.all(
                                      color: const Color(0xFFECE9E9),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.001,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: currency,
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: forminputcolor,
                                              fontWeight: FontWeight.w500)),
                                      hint: Text('',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 10.00.sp,
                                                  color: formhintcolor,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      onChanged: (newValue) {
                                        setState(() {
                                          if (newValue != null) {
                                            setState(() {
                                              currency = newValue.toString();
                                              print('newwvalue');
                                              print(newValue.toString());
                                            });
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: const Color(0xFF737070),
                                      ),
                                      items: proposalCurrencyController
                                              .getproposalCurrency[0]
                                              .data
                                              .isEmpty
                                          ? []
                                          : proposalCurrencyController
                                              .getproposalCurrency[0].data
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id.toString(),
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 4),
                                                    child: Text(
                                                        '${value.symbol.toString()}${value.name.toString()}',
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    10.00.sp,
                                                                color:
                                                                    forminputcolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)))),
                                              );
                                            }).toList(),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 7.00.hp,
                                  width: 40.00.wp,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: teal1.withOpacity(0.1),
                                    border: Border.all(
                                      color: const Color(0xFFECE9E9),
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.001,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: discount,
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: forminputcolor,
                                              fontWeight: FontWeight.w500)),
                                      hint: Text('discount type',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 10.00.sp,
                                                  color: formhintcolor,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      onChanged: (newValue) {
                                        setState(() {
                                          if (newValue != null) {
                                            setState(() {
                                              discount = newValue.toString();
                                              print('newwvalue');
                                              print(newValue.toString());
                                            });
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: const Color(0xFF737070),
                                      ),
                                      items: proposalDiscountController
                                              .getproposalCurrency[0]
                                              .data
                                              .isEmpty
                                          ? []
                                          : proposalDiscountController
                                              .getproposalCurrency[0].data
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                              return DropdownMenuItem<String>(
                                                value: value.value.toString(),
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 4),
                                                    child: Text(
                                                        value.name.toString(),
                                                        style: GoogleFonts.jost(
                                                            textStyle: TextStyle(
                                                                fontSize:
                                                                    10.00.sp,
                                                                color:
                                                                    forminputcolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)))),
                                              );
                                            }).toList(),
                                    ),
                                  )),
                            ],
                          ),
                        ]),
                    SizedBox(
                      height: 2.0.hp,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonIconButton(
                        press: () async {
                          Get.to(ProposalEditNextPage(
                            proposalid: widget.proposalid.toString(),
                            leadid: widget.leadid.toString(),
                            subjectname: proposalEditController.subject.text,
                            opentillname: proposalEditController.oepntill.text,
                            datename: proposalEditController.date.text,
                            proposaltoname: proposalEditController.toname.text,
                            countryname: proposalEditController.country.value,
                            zipname: proposalEditController.zip.text,
                            statename: proposalEditController.state.text,
                            cityname: proposalEditController.city.text,
                            addressname: proposalEditController.address.text,
                            emailname: proposalEditController.tomail.text,
                            phonename: proposalEditController.phone.text,
                            status: proposalEditController.statusid.value,
                            currencyname: currency,
                          ));
                        },
                        bgcolor: appcolor,
                        bordercolor: appcolor,
                        text: 'NEXT',
                      ),
                    ),
                    SizedBox(
                      height: 5.0.hp,
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }
}
