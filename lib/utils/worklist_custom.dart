import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

class WorkListCustom extends StatefulWidget {
  const WorkListCustom({super.key,this.name,this.value});
final String? name;
final String? value;
  @override
  State<WorkListCustom> createState() => _WorkListCustomState();
}

class _WorkListCustomState extends State<WorkListCustom> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
                                  
                                  children: [
                                    Container(
                                      width: 40.0.wp,
                                      child: Text("${widget.name} : ",style: listtitle,)),   Container(
                                        width: 40.0.wp,
                                        child: Text('${widget.value}',style: listtitle,)),
                                ],),
                              );
  }
}