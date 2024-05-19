// import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:leadingmanagementsystem/controller/graph_controller.dart';

 

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
 

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  GraphController graphController = Get.put(GraphController());
   
  //var itemdata = ['Gagnants', 'Répétiteurs', 'Utilisé'];
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
     
    // setState(() {
    //    graphController.graphController();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(left:18.0),
               child: Text('Total Work Graph',style: listtitle,),
             ),
             SizedBox(height: 1.0.hp,),
             Padding(
               padding: const EdgeInsets.only(left:10.0,right: 10),
               child: Container(
                height: 8.0.hp,
                width: 100.0.wp,
               // decoration: BoxDecoration(border: Border.all(color: formhintcolor)),
                child: Card(
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Container(
                            width: 45.0.wp,
                          child: Row(
                            children: [
                              SizedBox(width: 2.0.wp,),
                              Container(
                                height: 2.0.hp,
                                width: 5.0.wp,
                                decoration: BoxDecoration(
                                  color: Colors.amber[900],
                                  shape: BoxShape.rectangle
                                ),
                              ),
                                SizedBox(width: 1.0.wp,),
                              Text('Today Job',style: listtitlefont,)
                            ],
                          ),
                        ),
                          Container(
                              width: 45.0.wp,
                            child: Row(
                            children: [
                              
                              Container(
                                height: 2.0.hp,
                                width: 5.0.wp,
                                decoration: BoxDecoration(
                                  color: Colors.green[900],
                                  shape: BoxShape.rectangle
                                ),
                              ),
                                SizedBox(width: 1.0.wp,),
                              Text('Completed Job',style: listtitlefont,)
                            ],
                                                  ),
                          ),
                          
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Container(
                            width: 45.0.wp,
                          child: Row(
                            children: [
                              SizedBox(width: 2.0.wp,),
                              Container(
                                height: 2.0.hp,
                                width: 5.0.wp,
                                decoration: BoxDecoration(
                                  color: Colors.purple[900],
                                  shape: BoxShape.rectangle
                                ),
                              ),
                                SizedBox(width: 1.0.wp,),
                              Text('Pending Job',style:listtitlefont)
                            ],
                          ),
                        ),
                          Container(
                              width: 45.0.wp,
                            child: Row(
                            children: [
                              
                              Container(
                                height: 2.0.hp,
                                width: 5.0.wp,
                                decoration: BoxDecoration(
                                  color: Colors.red[900],
                                  shape: BoxShape.rectangle
                                ),
                              ),
                                SizedBox(width: 1.0.wp,),
                              Text('Total Work',style: listtitlefont,)
                            ],
                                                  ),
                          ),
                          
                      ],
                    ),
                  ]),
                ),
                           ),
             ),
              SizedBox(height: 2.0.hp,),
            Container(
              height: 32.0.hp,
              width: 100.0.wp,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    // var data=graphController.getnotification[0].data[index];
                    //  var sorteddata=[data[0].count,data[1].count,data[2].count,data[3].count];
  
  
                  
                    return Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.6,
                          child: BarChart(BarChartData(
                              borderData: FlBorderData(
                                  border: Border(
                                      top: BorderSide.none,
                                      left: BorderSide(),
                                      bottom: BorderSide())),
                              alignment: BarChartAlignment.spaceAround,
                              barTouchData: BarTouchData(enabled: false),
                              maxY: 100,
                            
                              minY: 0,
                              gridData: FlGridData(
                                  drawHorizontalLine: false,
                                  drawVerticalLine: false),
                              titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: AxisTitles(),
                                  topTitles: AxisTitles(),
                                  bottomTitles: AxisTitles(
                                      axisNameSize: 30,
                                      axisNameWidget: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          
                                           
                                        ],
                                      ))),
                              barGroups: [
                                BarChartGroupData(x: 0, barRods: [
                                  BarChartRodData(
                                      toY:  50,
                                      
                                         
                                      width: 10.0.wp,
                                      borderRadius: BorderRadius.zero,
                                      color: Colors.amber[900])
                                ]),
                                BarChartGroupData(x: 1, barRods: [
                                  BarChartRodData(
                                     toY:  30,
                                     
                                         
                                      width: 10.0.wp,
                                     
                                      borderRadius: BorderRadius.zero,
                                      color: Colors.green[900])
                                ]),
                                BarChartGroupData(x: 2, barRods: [
                                  BarChartRodData(
                                     toY: 20,
                                       
                                      width: 10.0.wp,
                                      borderRadius: BorderRadius.zero,
                                      color: Colors.purple[900])
                                      
                                ]),

                                 BarChartGroupData(x: 4, barRods: [
                                  BarChartRodData(
                                     toY: 10,
                                        
                                      width: 10.0.wp,
                                     
                                      borderRadius: BorderRadius.zero,
                                      color: logocolor)
                                ]),
                              ])),
                              
                        ),
                        
                      ],
                    );
                  }),
            ),
          ],
        );
      }
    
  }
 
