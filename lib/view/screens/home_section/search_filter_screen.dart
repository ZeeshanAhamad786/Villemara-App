import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import '../../../controller/custom_widgets/constant.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({Key? key}) : super(key: key);

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  RxBool first = true.obs;
  RxBool second = false.obs;
  RxBool third = false.obs;
  RxBool fourth = false.obs;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new, size: 18.px)),
            Text("Search Filters", style: Constant.textDesc),
            SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          children: [getVerticalSpace(5.h),
            GestureDetector(
              onTap: () {
                first.value = true;
                second.value = false;
                third.value = false;
                fourth.value = false;
              },
              child: Obx(() => CustomFilter(
                text: "Renting",
                icon: Icons.check,
                isSelected: first.value,
              )),
            ),
            getVerticalSpace(3.h),
            GestureDetector(
              onTap: () {
                first.value = false;
                second.value = true;
                third.value = false;
                fourth.value = false;
              },
              child: Obx(() => CustomFilter(
                text: "Developments",
                icon: Icons.check,
                isSelected: second.value,
              )),
            ),
            getVerticalSpace(3.h),
            GestureDetector(
              onTap: () {
                first.value = false;
                second.value = false;
                third.value = true;
                fourth.value = false;
              },
              child: Obx(() => CustomFilter(
                text: "Joint Ventures",
                icon: Icons.check,
                isSelected: third.value,
              )),
            ),
            getVerticalSpace(3.h),
            GestureDetector(
              onTap: () {
                first.value = false;
                second.value = false;
                third.value = false;
                fourth.value = true;
              },
              child: Obx(() => CustomFilter(
                text: "Special Purpose Vehicles",
                icon: Icons.check,
                isSelected: fourth.value,
              )),
            ),
            getVerticalSpace(4.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 2.w),
              decoration: BoxDecoration(color:MyColor.blackBoldColor,borderRadius: BorderRadius.circular(20)),
              child: Text("Done",style: Constant.textDone,),
            )
          ],
        ),
      ),
    );
  }
}
