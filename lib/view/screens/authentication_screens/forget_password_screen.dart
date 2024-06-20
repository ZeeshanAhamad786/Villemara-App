import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/custom_text_form_feld.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/authentication_screens/login_screen.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(padding: EdgeInsets.symmetric(horizontal: 4.6.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.h,
                child: SvgPicture.asset('assets/svg/verfy.svg')),
            getVerticalSpace(2.3.h),
            Text(
              "Forgot Password",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.px, fontWeight: FontWeight.w400,color: const Color(0xff444444),fontFamily: 'medium'),
            ),
            getVerticalSpace(.6.h),
            Text(
              "Please enter your registered mail address",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.px, fontWeight: FontWeight.w400,color: const Color(0xff444444),fontFamily: 'medium'),
            ),            getVerticalSpace(3.h),
            CustomTextFormField(
              hintText: 'Email',readOnly: false,
              prefixIcon: SvgPicture.asset('assets/svg/emailicon.svg'),
            ), getVerticalSpace(3.h),
            GestureDetector(
              onTap: () {
                Get.to(()=>const LoginScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.h, vertical: 1.1.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColor.blackBoldColor,
                    borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(color: MyColor.blackBoldColor)),
                child: Text(
                  'Done',
                  style:
                  Constant.buttonText.copyWith(color: Colors.white),
                ),
              ),
            ),

          ],),
      ),
    );
  }
}
