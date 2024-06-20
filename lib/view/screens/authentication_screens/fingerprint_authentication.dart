import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/custom_text_form_feld.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

import 'email_confirmation_screen.dart';

class FingerPrintAuthentication extends StatelessWidget {
  const FingerPrintAuthentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.h),
          child: Column(
            children: [
              getVerticalSpace(6.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 2.h,
                      )),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Fingerprint Authentication',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'medium',
                        color: const Color(0xff000E08),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.px),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              getVerticalSpace(4.6.h),
              Text(
                'Password Required!',
                textAlign: TextAlign.center,
                style: Constant.headingText.copyWith(fontFamily: 'medium'),
              ),
              getVerticalSpace(.6.h),
              Text(
                'Enter your password to verify its you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'medium',
                    color: const Color(0xff444444),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.px),
              ),
              getVerticalSpace(3.h),
              SvgPicture.asset('assets/svg/authenticationimsvg.svg'),
              getVerticalSpace(3.h),
              CustomTextFormField(
                hintText: 'Password',
                prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
                readOnly: false,
                suffixIcon: SvgPicture.asset('assets/svg/eye-off.svg'),
              ),
              getVerticalSpace(8.h),
              GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Container(margin: EdgeInsets.symmetric(horizontal: 2.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.h, vertical: 1.1.h),
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
      ),
    );
  }
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              height: 43.h,
              width: 33.2.h,
              padding: EdgeInsets.symmetric(horizontal: 4.4.h, vertical: 2.8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5.h),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Fingerprint Authentication",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xff444444),
                      fontSize: 18.px,
                      fontFamily: 'medium',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  getVerticalSpace(1.h),
                  Text(
                    'Hold on to your mobile fingerprint sensor to activate.',
                    textAlign: TextAlign.center,
                    style: Constant.buttonText.copyWith(
                        color: const Color(0xff717171),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'regular'),
                  ),
                  getVerticalSpace(3.h),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const EmailConfirmation(title: 'fingerAuth',));
                      },
                      child: SvgPicture.asset('assets/svg/finger.svg'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
