import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/customtextfield.dart';
import '../../../controller/custom_widgets/my_color.dart';
import '../../../model/project_model.dart';
class MyProjectAddNew extends StatefulWidget {
  const MyProjectAddNew({Key? key}) : super(key: key);

  @override
  State<MyProjectAddNew> createState() => _MyProjectAddNewState();
}

class _MyProjectAddNewState extends State<MyProjectAddNew> {
  final PageController _controller = PageController();
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
            Text("My Projects", style: Constant.projectTitle),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
              decoration: BoxDecoration(
                border: Border.all(color: MyColor.blackBoldColor),
                color: MyColor.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text("Add New", style: Constant.addNew),
                ],
              ),
            ),

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
                     Stack(children: [
                       Image.asset(data[index].imageUrl),
                       Positioned(top: 1.h,right: 2.w,
                           child: Container(
                               padding:EdgeInsets.only(right: 2.w,left: 2.w,top: 2.w,bottom: 2.w) ,
                               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                   color: Colors.white.withOpacity(0.58)),
                               child: Icon(Icons.delete,color: MyColor.textRed,)
                           )),
                       Positioned(
                         bottom: 2.h,right: 16.h,
                         child:    Center(
                           child: SmoothPageIndicator(
                             controller: _controller,
                             count: 4,
                             effect: CustomizableEffect(
                               activeDotDecoration: DotDecoration(
                                 height: 0.8.h,
                                 width: 2.2.h,
                                 color: MyColor.white,
                                 borderRadius: BorderRadius.circular(32.px),
                               ),
                               dotDecoration: DotDecoration(height: 0.8.h, width: 0.8.h, color: Colors.white, borderRadius: BorderRadius.circular(32.px)),
                               spacing: 1.2.h,
                             ),
                           ),
                         ),
                       )
                     ],),
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
