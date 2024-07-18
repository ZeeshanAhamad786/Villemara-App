import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
class GiveRecommendationScreen extends StatelessWidget {
  const GiveRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController=TextEditingController();
    final TextEditingController membersNameController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new, size: 18.px)),
            Text("Appreciations", style: Constant.textLikes),
            const SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          getVerticalSpace(3.h),
          customTextField('Member Name(Choose member)', membersNameController),
          getVerticalSpace(3.h),
         customTextField('Write Something.....', descriptionController),
          getVerticalSpace(6.h),
          GestureDetector(onTap: (){
            Get.back();
          },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 4.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: MyColor.blackBoldColor),
              child: const Center(child: Text("Done",style: TextStyle(color: Colors.white),)),
            ),
          )
        ],),
      ),
    );
  }
}
