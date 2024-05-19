import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/signup_button.dart';
import 'package:leadingmanagementsystem/utils/utils.dart';

import '../../../utils/textstyles.dart';
 File ?_image;
final picker = ImagePicker();
class StartJob extends StatefulWidget {
  const StartJob({super.key});

  @override
  State<StartJob> createState() => _StartJobState();
}

class _StartJobState extends State<StartJob> {
 
Future getImageFromGallery() async {
  var pickedFile = await picker.pickImage(source: ImageSource.camera);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  });
}

//Image Picker function to get image from camera
Future getImageFromCamera() async {
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
         leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: screenbackground,)),
        backgroundColor: appcolor,title: Text('Start Job',style: toptitleStyle,),),

    
      body: Padding(
        padding: const EdgeInsets.only(left:18.0,right: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                        height: 1.0.hp,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Text(
                        'Mid Installation Selfie*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:ListTile(
                              leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                              title: Text('https://cherritech.us/proelevators/download/file/lead_attachment/1',style: notificationsubtitle,),
                              
                              trailing: InkWell(
                                onTap: (){
                              
                                   getImageFromGallery();
                                 //Get.to(  MyDialog());
                                },
                                child: Icon(Icons.camera_alt,color: appcolor1,)),
                            )
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Text(
                        'Panel Serial Numbers*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:TextFormField(
                      
                        
                        
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            
                           // fillColor:   appcolor.withOpacity(0.2),
                           
                           hintText: 'Enter Panel Serial Number',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                           ),
                      ),
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Text(
                        'Inverter Serial Number*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                     Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:TextFormField(
                      
                        
                        
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            
                           // fillColor:   appcolor.withOpacity(0.2),
                           
                           hintText: 'Enter Inverter Serial Number*',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                           ),
                      ),
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Text(
                        'Panel Serial Number Photo*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:ListTile(
                              leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                              title: Text('https://cherritech.us/proelevators/download/file/lead_attachment/1',style: notificationsubtitle,),
                              
                              trailing: InkWell(
                                onTap: (){
                              
                                  setState(() {
                                        
                                     
                                     
                                    
                            
                                    //deleteaddon(id: widget.id.toString(),index: index);
                                  });
                                },
                                child: Icon(Icons.camera_alt,color: appcolor1,)),
                            )
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Text(
                        'Panel Back Label Photo*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:ListTile(
                              leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                              title: Text('https://cherritech.us/proelevators/download/file/lead_attachment/1',style: notificationsubtitle,),
                              
                              trailing: InkWell(
                                onTap: (){
                              
                                  setState(() {
                                        
                                     
                                     
                                    
                            
                                    //deleteaddon(id: widget.id.toString(),index: index);
                                  });
                                },
                                child: Icon(Icons.camera_alt,color: appcolor1,)),
                            )
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Text(
                        'Panel Installed Photo*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:ListTile(
                              leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                              title: Text('https://cherritech.us/proelevators/download/file/lead_attachment/1',style: notificationsubtitle,),
                              
                              trailing: InkWell(
                                onTap: (){
                              
                                  setState(() {
                                        
                                     
                                     
                                    
                            
                                    //deleteaddon(id: widget.id.toString(),index: index);
                                  });
                                },
                                child: Icon(Icons.camera_alt,color: appcolor1,)),
                            )
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                       Text(
                        'Other Panel Photo*',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      Container(
                        
                        height: 7.00.hp, width: 100.00.wp,
                        // padding: const EdgeInsets.only(
                        //   left: 20,
                        //   right: 20,
                        // ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffD9D9D9).withOpacity(0.1),border: Border.all(color: formhintcolor)),
                            child:ListTile(
                              leading: Image.asset('assets/images/folder.png',height: 4.0.hp,),
                              title: Text('https://cherritech.us/proelevators/download/file/lead_attachment/1',style: notificationsubtitle,),
                              
                              trailing: InkWell(
                                onTap: (){
                              
                                  setState(() {
                                        
                                     
                                     
                                    
                            
                                    //deleteaddon(id: widget.id.toString(),index: index);
                                  });
                                },
                                child: Icon(Icons.camera_alt,color: appcolor1,)),
                            )
                      ),
                      SizedBox(
                        height: 1.0.hp,
                      ),
                      
                      
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonIconButton(
                            press: () async {
                                          setState(() {
                              
                                          });
                            },
                            bgcolor: appcolor,
                            bordercolor: appcolor,
                            text: 'Submit Mid Job',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0.hp,
                      )
              
          
            ],
          ),
        ),
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {

  String ?imagePath;
  Image ?image;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            Container(child: image!= null? image:null),
            GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.camera),
                    SizedBox(width: 5),
                    Text('Take a picture                       '),
                  ],
                ),
                onTap: () async {
                  await getImageFromCamera();
                  setState(() {

                  });
                }),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ],
        ),
      ),
    );
  }
  Future getImageFromCamera() async {
    var x = await picker.pickImage(source: ImageSource.camera);
    imagePath = x!.path;
    image = Image(image: FileImage(File(x.toString())));
  }
}