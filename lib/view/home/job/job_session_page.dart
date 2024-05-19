import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/view/home/job/start_job.dart';

import '../../../utils/textstyles.dart';

class JobSessionPage extends StatefulWidget {
  const JobSessionPage({super.key});

  @override
  State<JobSessionPage> createState() => _JobSessionPageState();
}

class _JobSessionPageState extends State<JobSessionPage> {
  var items=['Start Job','Mid Job','End Job','Installer Designer Written Statement','Installation Status update'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: appcolor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
         centerTitle: true,
         leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: screenbackground,)),
        backgroundColor: appcolor,title: Text('Job List',style: toptitleStyle,),),
        body: ListView.builder(
  
  padding: EdgeInsets.all(8.0), // padding around the grid
  itemCount: items.length, // total number of items
  itemBuilder: (context, index) {
    return InkWell(
      onTap: () {
        Get.to(StartJob());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
             color:Color(0xfff5eff9), // color of grid items
            borderRadius: BorderRadius.circular(5)),
          height: 10.0.hp,
         
          child: Center(
            child: Text(
              items[index],
              style: listtitle,
            ),
          ),
        ),
      ),
    );
  },
),
    
    );
  }
}