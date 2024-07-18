import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:villemara_app/controller/utils/shared_preferences.dart';
import 'package:villemara_app/view/screens/authentication_screens/welcome_screen.dart';
import 'package:villemara_app/view/screens/bottom_navigation_bar.dart';
import '../controller/utils/constant.dart';
import '../controller/utils/customtextfield.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.to(() => WelcomeScreen());
      // nextScreen();
    });
  }

  // void nextScreen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   log('Token: $token'); // Debug print to check the token value
  //
  //   if (token != null && token.isNotEmpty) {
  //     log('Navigating to BottomNavigationScreen'); // Debug print to confirm navigation
  //     Get.offAll(() => BottomNavigationScreen());
  //   } else {
  //     log('Navigating to WelcomeScreen'); // Debug print to confirm navigation
  //     Get.offAll(() => WelcomeScreen());
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/applogo.svg'),
            getVerticalSpace(1.2.h),
            Text(
              'Villemara',
              style: Constant.headingText1,
            )
          ],
        ),
      ),
    );
  }
}
