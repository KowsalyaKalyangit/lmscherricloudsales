import 'dart:io';

import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/assign/leadprofile.dart';
import 'package:leadingmanagementsystem/view/assign/task/reminderpage.dart';
import 'package:leadingmanagementsystem/view/assign/work_list_next.dart';
import 'package:leadingmanagementsystem/view/audio_record/get_note_details.dart';

import '../../controller/attachment_details_controller.dart';

import '../../utils/worklist_custom.dart';
import '../activit_screen.dart';
import '../proposal/get_proposal_page.dart';
import 'attachement_screen.dart';

import '../audio_record/note_page.dart';
import 'proposal_page.dart';
import 'task/get_task.dart';

class LeadsDetailsPage extends StatefulWidget {
  const LeadsDetailsPage({
    super.key,
  });

  @override
  State<LeadsDetailsPage> createState() => _LeadsDetailsPageState();
}

class _LeadsDetailsPageState extends State<LeadsDetailsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  AttchamentLeadsDetailsController attchamentLeadsDetailsController =
      AttchamentLeadsDetailsController();

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  trackfunc() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Alert Dialog Box"),
        content: const Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("okay"),
            ),
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appcolor,
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
        title: Text(
          'Testing',
          style: toptitleStyle,
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: InkWell(
        //         onTap: (){
        //           trackfunc();
        //         },
        //         child: Icon(Icons.location_on_outlined,color: logocolor,)),
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white,
          elevation: 1,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  WorkListCustom(
                    name: 'Wo Number',
                    value: 'W01654',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Property Type',
                    value: 'Residential',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Customer First Name',
                    value: 'Test',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Customer Last Name',
                    value: 'Test',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Email',
                    value: 'testing@gmail.com',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Company',
                    value: 'cherri',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Customer Address',
                    value: 'No 5, sarathy nagar\n Podicherry',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Install Date',
                    value: '10-May-2023',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Deeming Period',
                    value: '08',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Building Height',
                    value: 'Single',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Installation Type',
                    value: 'New System',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'Complete Unit',
                    value: 'Yes',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'System mounting type',
                    value: 'Building or Structure',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'System Size',
                    value: '6.6000',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                  WorkListCustom(
                    name: 'System Install Status',
                    value: 'Open',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                WorkListCustom(
                    name: 'Start Job Status',
                    value: 'Pending',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                WorkListCustom(
                    name: 'Mid Job Status',
                    value: 'Open',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
                WorkListCustom(
                    name: 'End Job Status',
                    value: 'Open',
                  ),
                  CustomPaint(
                  size: Size(355, 1), // Size of the line
                  painter: DottedLinePainter(),
                ),
            
                SizedBox(height: 2.0.hp,),
                InkWell(
                  onTap: () {
                    Get.to(WorkListNextPage(),);
                  },
                  child: Container(
                    height: 4.0.hp,
                    width: 30.0.wp,
                    decoration: BoxDecoration(
                      color: appcolor1,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text('Next',style: listtitle,),),
                  ),
                ),
                 SizedBox(height: 2.0.hp,),
                
            
                ]),
          ),
        ),
      ),
    );
  }
}


