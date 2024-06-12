import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/view/screens/authentication_screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  Future.delayed(const Duration(seconds: 5)).then((value) {
    Get.offAll(()=>WelcomeScreen());
  });
  }
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
