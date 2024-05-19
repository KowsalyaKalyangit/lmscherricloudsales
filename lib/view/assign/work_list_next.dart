import '../../allpackages.dart';
import '../../utils/textstyles.dart';
import '../../utils/worklist_custom.dart';
import 'task/get_task.dart';

class WorkListNextPage extends StatefulWidget {
  const WorkListNextPage({super.key});

  @override
  State<WorkListNextPage> createState() => _WorkListNextPageState();
}

class _WorkListNextPageState extends State<WorkListNextPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
        
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(height: 3.0.hp,),
                 WorkListCustom(
                        name: 'Installer Signature Status',
                        value: 'Pending',
                      ),
                      CustomPaint(
                      size: Size(355, 1), // Size of the line
                      painter: DottedLinePainter(),
                    ),
                      WorkListCustom(
                        name: 'Job Paper work Status',
                        value: 'Pending',
                      ),
                      CustomPaint(
                      size: Size(355, 1), // Size of the line
                      painter: DottedLinePainter(),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text('System Layouts',style: listtitle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0,top: 5.0),
                      child: Container(
                        height: 20.0.hp,
                        width: 40.0.wp,
                        decoration: BoxDecoration(
                          border: Border.all(color: formhintcolor)
                        ),
                        child: Center(
                          child: Image.asset('assets/tech/industry.png'),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 14.0,top: 10.0),
                      child: Container(
                        height:4.0.hp,
                        width: 40.0.wp,
                        decoration: BoxDecoration(
                          color: appcolor,
                          border: Border.all(color: appcolor),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text('System Components',style: statusstyle,),
                        ),
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.only(left:14.0,top: 10),
                      child: Text('Panels',style: listtitle,),
                    ),
                      Padding(
                     padding: const EdgeInsets.only(left:14.0,top: 3,bottom: 5),
                      child: Text('Axitech Energy ',style: formhintstyle,),
                    ),
                      CustomPaint(
                      size: Size(355, 1), // Size of the line
                      painter: DottedLinePainter(),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left:14.0,top: 10),
                      child: Text('Inverters',style: listtitle,),
                    ),
                      Padding(
                     padding: const EdgeInsets.only(left:14.0,top: 3,bottom: 5),
                      child: Text('Axitech Energy ',style: formhintstyle,),
                    ),
                      CustomPaint(
                      size: Size(355, 1), // Size of the line
                      painter: DottedLinePainter(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0,top: 10.0),
                      child: Container(
                        height:4.0.hp,
                        width: 40.0.wp,
                        decoration: BoxDecoration(
                          color: appcolor,
                          border: Border.all(color: appcolor),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text('Retailer',style: statusstyle,),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.0.hp,),
                    Center(child: Text('No records Found ',style: formhintstyle,)),
                      SizedBox(height: 3.0.hp,),
              ],
            ),
          ),
        ) ,
        );
  }
}