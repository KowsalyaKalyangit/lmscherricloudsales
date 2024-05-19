import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/colors.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/utils/utils.dart';

import '../../controller/leads_details_controller.dart';
import 'lead_assign.dart';
import 'leads_details_page.dart';

class LeadPage extends StatefulWidget {
  const LeadPage({super.key});

  @override
  State<LeadPage> createState() => _LeadPageState();
}

class _LeadPageState extends State<LeadPage> {
  LeadsDetailsController leadsDetailsController=Get.put(LeadsDetailsController());
  var status=['Converted','Pending'];
  @override
  void initState() {
    leadsDetailsController.leadsDetailsController();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButton: FloatingActionButton(
      //   backgroundColor: logocolor,
      //   onPressed: (){
      //     Get.to(AssignLeadsPage());
      //   },child: Icon(Icons.add),),
     
     
      appBar: AppBar(
            automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: appcolor,title: Text('Work Order List',style: toptitleStyle,),),
        body:   Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 8),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
               // var data=leadsDetailsController.getleadsdetails[0].data[index];
              return Stack(
                children: [
                  Container(
                    height: 25.0.hp,
                    width: 100.0.wp,
                     
                    child: Card(
                      color: appcolor,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(05)
                      ),
                      child: Row(children: [
                        
                         
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              
                              children: [
                                
                                Text("Work Number :",style: listtitlecolor,),  Text('W016054',style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              
                              children: [
                                
                                Text("Name :",style: listtitlecolor,),  Text('Testing',style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              
                              children: [
                                Text("Email : ",style: listtitlecolor,),  Text('testing@gmail.com',style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              
                              children: [
                                Text("Phone : ",style: listtitlecolor,),   Text('1234567890' ,style: listtitlecolor,),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              
                              children: [
                                Text("Company : ",style: listtitlecolor,),   Text('Cherri',style: listtitlecolor,),
                            ],),
                          ),
                            CustomPaint(
      size: Size(355, 1), // Size of the line
      painter: DottedLinePainter(),
    ),
                             
                             
                               InkWell(
                                onTap: () {
                                 Get.to(LeadsDetailsPage());
                                },
                                 child: Padding(
                                   padding: const EdgeInsets.only(left:8.0,top: 2),
                                   child: Text('View',style: GoogleFonts.jost(
                                     textStyle: TextStyle(
                                       decoration: TextDecoration.underline,
                                         fontSize: 10.00.sp,
                                         color: 
                                         Colors.blue,
                                         fontWeight: FontWeight.w500)),),
                                 ),
                               )
                          ],
                        )
                      ],),
                    )
                    
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Container(
                        height: 4.0.hp,
                        width: 25.0.wp,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: index==0?  Colors.green[900]:index==1?Colors.amber[900]:Colors.blue
                        
                        ),
                        child: Center(
                          child: Text(index==0?'Completed':index==1?'pending':'Start'
                            ,style: statusstyle,),
                        ),
                      ),
                    )
                ],
              );
            }),
           
  ));}
    
   
}
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final dashWidth = 4;
    final dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}