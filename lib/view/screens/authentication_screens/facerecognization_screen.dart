import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

import '../../../controller/custom_widgets/constant.dart';
import 'email_confirmation_screen.dart';

class FaceRecognization extends StatelessWidget {
  const FaceRecognization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.6.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getVerticalSpace(6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 2.4.h,
                    )),
                const Expanded(child: SizedBox()),
                Text(
                  'Face Recognition',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'medium',
                      color: const Color(0xff050505),
                      fontWeight: FontWeight.w400,
                      fontSize: 18.px),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            getVerticalSpace(5.6.h),
            const Image(image: AssetImage('assets/png/facecheck.png')),
            getVerticalSpace(2.4.h),
            // Text(
            //   "Hold your face In-front of camera",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       fontSize: 12.px,
            //       fontWeight: FontWeight.w400,
            //       color: const Color(0xff717171),
            //       fontFamily: 'medium'),
            // ),
            getVerticalSpace(5.3.h),
            GestureDetector(
              onTap: () {
                Get.to(()=>const EmailConfirmation());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2.h),
                padding:
                    EdgeInsets.symmetric(horizontal: 5.2.h, vertical: 1.1.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColor.blackBoldColor,
                    borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(color: MyColor.blackBoldColor)),
                child: Text(
                  'Done',
                  style: Constant.buttonText.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
