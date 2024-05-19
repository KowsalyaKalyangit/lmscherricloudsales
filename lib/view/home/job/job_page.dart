import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import 'job_session_page.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
         centerTitle: true,
        backgroundColor: appcolor,title: Text('Job List',style: toptitleStyle,),),

     
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          color: screenbackground,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
                     padding: const EdgeInsets.only(left:14.0,top: 3,bottom: 5),
                      child: Text('Wo16054 ',style: listtitle,),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                         padding: const EdgeInsets.only(left:14.0,top: 3,bottom: 5),
                          child: Text('59 the blvd, Gisborne, WA, 6155 ',style: formhintstyle,),
                                             ),
                                             InkWell(
                                              onTap: () {
                                                Get.to(JobSessionPage());
                                              },
                                               child: Padding(
                                                 padding: const EdgeInsets.only(right:14.0,),
                                                 child: Icon(Icons.arrow_forward_ios,size: 15,),
                                               ),
                                             )
                       ],
                     ),
                     Padding(
                     padding: const EdgeInsets.only(left:14.0,top: 3,bottom: 5),
                      child: Text('Test ',style: formhintstyle,),
                    ),
          ],
          ),
        );
      })
    );
  }
}