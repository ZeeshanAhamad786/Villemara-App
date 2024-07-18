import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/authentication_screens/login_screen.dart';
import 'package:villemara_app/view/screens/authentication_screens/signup_screen.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
import '../../../controller/utils/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.5.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getVerticalSpace(25.7.h),
            SvgPicture.asset('assets/svg/applogo.svg'),
            getVerticalSpace(1.2.h),
            Text(
              'Villemara',
              style: Constant.headingText1,
            ),
            getVerticalSpace(5.h),
            Text(
              "Welcome to Villemara Your Perfect Property",
              textAlign: TextAlign.center,
              style: Constant.buttonText
                  .copyWith(fontSize: 18.px, fontWeight: FontWeight.w400),
            ),
            getVerticalSpace(1.h),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Et nam null consequent nisei collision amet adipiscing eget. ",
              textAlign: TextAlign.center,
              style: Constant.buttonText.copyWith(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff717171)),
            ),
            getVerticalSpace(6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(() =>  LoginScreen());
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 1.1.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(color: MyColor.blackBoldColor)),
                    child: Text(
                      'Log In',
                      style: Constant.buttonText
                          .copyWith(color: MyColor.blackBoldColor),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const SignUpScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.2.h, vertical: 1.1.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyColor.blackBoldColor,
                        borderRadius: BorderRadius.circular(10.h),
                        border: Border.all(color: MyColor.blackBoldColor)),
                    child: Text(
                      'Sign Up',
                      style: Constant.buttonText.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
