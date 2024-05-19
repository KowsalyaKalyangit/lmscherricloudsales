import 'dart:io';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/dashboard_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/converted_leads.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/pending_leads.dart';
import 'package:leadingmanagementsystem/view/home/dashboard/renewable.dart';
import 'package:leadingmanagementsystem/view/home/graph_page.dart';
import 'package:leadingmanagementsystem/view/home/map.dart';
import 'package:leadingmanagementsystem/view/notification/notification_screen.dart';
 
import 'dashboard/image_slider.dart';
import 'final_ios.dart';
import 'leads_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var leads = ['Today Job', 'Completed Job', 'Pending Job', 'Total'];
   var leadscount = ['6', '5', '1', '10'];
  var name;
  var menus = [ConvertedLeadsPage(), PendingLeadsPage(), RenewableLeadsPage()];
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    dashboardController.dashboardController();
    // _initLocationService();
    super.initState();
  }

  Future<void> _initLocationService() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          automaticallyImplyLeading: false,
           backgroundColor: Color(0xfff4f4f4),
          toolbarHeight: 11.0.hp,
          leadingWidth: 20.0.wp,
          leading: Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child: Image.asset('assets/tech/applogo.png'),
          ),
          title:  
             Image.asset('assets/tech/logoname.png',height: 5.5.hp,),
               
      
          actions: [
            InkWell(
              onTap: () {
                Get.to(NotificationScreen());
//     showDialog(
//   context: context,
//   builder: (_) => new AlertDialog(
//      insetPadding: EdgeInsets.only(top: 5),
//           contentPadding: EdgeInsets.zero,
//   shape: RoundedRectangleBorder(
//     borderRadius:
//       BorderRadius.all(
//         Radius.circular(10.0))),
//       actions: [

//          Center(child: InkWell(
//           onTap: () {
//             setState(() {
//               print('click');
//               Get.back();
//             });
//           },
//           child: Container(height: 10.0.hp,width: 40.0.wp,color:Colors.tealAccent,)))],
//     content: StatefulBuilder(
//       builder: (context,setstate) {
//         // Get available height and width of the build area of this widget. Make a choice depending on the size.

//         return Container(
//           height:90.0.hp,
//           width: 100.0.wp,
//           child: Padding(
//               padding: EdgeInsets.only(bottom:2.0.hp),
//             child: GoogleMap(
//                    markers: markers.values.toSet(),
//                   mapType: MapType.normal,
//                   initialCameraPosition: CameraPosition(
//             target: _currentLocation,
//             zoom: 15.0,
//                   ),
//                   onMapCreated: (GoogleMapController controller) {
//             setState(() {
//               _mapController = controller;
//             });

//                   },
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,

//                 ),
//           ),
//         );
//       },
//     ),
//   )
// );

//  if(Platform.isAndroid){


//                  Get.to(MovingPage());
//   }
//   if(Platform.isIOS){
//     Get.to(IosLocationScreen());
//   }
  
 
//  Get.to(MovingPage());
//Get.to(MapScreen());
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: appcolor,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: 
                Column(children: [
                   
                ImageSliderHome(),
                //Text('Leading Management Software',style: heading,),
                // Text(
                //   "No of Leads: ${dashboardController.getdashboarddetails[0].totalLeads.toString()}",
                //   style: toptitlelogoStyle,
                // ),
                SizedBox(
                  height: 2.0.hp,
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 20.0.hp,
                      width: 100.0.wp,
                      decoration: BoxDecoration(
                          color: appcolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.0.hp,
                              ),
                              Container(
                                  height: 15.0.hp,
                                  width: 100.0.wp,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: leads.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 900 / 3,
                                            childAspectRatio: 9 / 2.90,
                                            crossAxisSpacing: 2,
                                            mainAxisSpacing: 5),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          // Get.to(ConvertedLeadsPage(
                                          //     name: leads[index]
                                                   
                                          //         .toString(),
                                          //     index: index,
                                          //     statusid: dashboardController
                                          //         .getdashboarddetails[0]
                                          //         .data[index]
                                          //         .id
                                          //         .toString()));
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          color: logocolor,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                 leads[index]
                                                       
                                                      .toString(),
                                                  style: subtitleStylecolor,
                                                ),
                                                Text(
                                                 leadscount[index]
                                                      
                                                      .toString(),
                                                  style: subtitleStylecolor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                              SizedBox(
                                height: 2.0.hp,
                              ),
                            ]),
                      ),
                    )),

                SizedBox(
                  height: 1.0.hp,
                ),

                BarChartExample(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Leads List',
                            style: listtitle,
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(LeadsViewList());
                              },
                              child: Container(
                                  height: 3.0.hp,
                                  width: 20.0.wp,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    'view',
                                    style: listtitle,
                                  )))),
                        ],
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        height: 5.0.hp,
                        width: 100.0.wp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: appcolor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: Row(
                            children: [
                              Container(
                                  width: 27.0.wp,
                                  child: Text(
                                    'SNo',
                                    style: subtitleStylecolor,
                                  )),
                              Container(
                                  width: 35.0.wp,
                                  child: Text(
                                    'Order Number',
                                    style: subtitleStylecolor,
                                  )),
                              Container(
                                  width: 20.0.wp,
                                  child: Text(
                                    'Status',
                                    style: subtitleStylecolor,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      
                        Container(
                              height: 13.0.hp,
                              width: 100.0.wp,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: ListView.builder(
                                    itemCount:  4,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, leadindex) {
                                      
                                      leadindex = leadindex + 1;

                                      return Container(
                                        height: 4.0.hp,
                                        width: 100.0.wp,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 25.0.wp,
                                                  child: Text(
                                                    leadindex.toString(),
                                                    style: listview,
                                                  )),
                                              Container(
                                                  width: 35.0.wp,
                                                  child: Text(
                                                    'W00654',
                                                    style: listview,
                                                  )),
                                              Container(
                                                  width: 20.0.wp,
                                                  child: Text(
                                                    'Pending',
                                                    style: formhintstylecolor,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.0.hp,
                ),
              ])));
            
        
         
  }
}
