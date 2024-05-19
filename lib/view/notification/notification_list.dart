 

import '../../allpackages.dart';
import '../../controller/notification_controller.dart';
import '../../utils/textstyles.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  NotificationController notificationController=Get.put(NotificationController());
  @override
  void initState() {
 // notificationController.notificationController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
          itemCount:10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          //  var notificationdata=notificationController.getnotification[0].data[index];
            return Column(
              children: [
                Center(
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 97.00.wp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 2, color: const Color(0xffF5F5F5)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  CircleAvatar(
                                  backgroundColor:appcolor,
                                  radius: 25, // Image radius
                                   child: CircleAvatar(
                                    backgroundColor: appcolor,
                                    child: Image.asset('assets/tech/applogo.png',height: 4.5.hp,),
                                   ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                              'Technaus',
                                                style: notificationtitle,
                                              ),
                                            ),
                                           
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                              ' TS - Installer Creator Portal Mobile Manual',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: notificationsubtitle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                        Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                '12-03-2023',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: formhintstyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.00.hp,
                )
              ],
            );
          });
  }
  }

