import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

import '../../../controller/custom_widgets/constant.dart';
import '../../../model/project_model.dart';
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  List<ProjectModel> data=[
    ProjectModel(imageUrl: 'assets/png/projectImage1.png', date: 'Mar 2019', description: 'Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus. olor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus. Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus. olor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.')
    ,ProjectModel(imageUrl: 'assets/png/projectImage1.png', date: 'Mar 2019', description: 'Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus. olor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus. Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus. olor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.')

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new, size: 18.px),
            ),
            Text("Projects", style: Constant.projectTitle),
            const SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
       Expanded(
         child: ListView.builder(
           itemCount: data.length,
             itemBuilder: (context,index){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 Image.asset(data[index].imageUrl),
                 getVerticalSpace(2.h),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Expanded(
                       child: RichText(
                           text: TextSpan(
                               style: TextStyle(color: Colors.black),
                               children: [
                                 TextSpan(
                                   text: 'Description: ',
                                   style: Constant.projectDesc
                                 ),
                                 TextSpan(
                                   text: data[index].description,
                                     style: Constant.currentJob
                                 ),
                               ]
                           )),
                     )
                   ],
                 ),
                 getVerticalSpace(1.h),
                 Row(
                   children: [
                      Text("Date: ",style: Constant.projectDesc,),
                     Text(data[index].date, style: Constant.currentJob),
                   ],
                 ),
               ],
             ),
           );
         }),
       ),

        ],),
      ),
    );
  }
}
