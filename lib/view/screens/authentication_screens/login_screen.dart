import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/custom_text_form_feld.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/authentication_screens/signup_screen.dart';
import 'package:villemara_app/view/screens/bottom_navigation_bar.dart';

import 'email_confirmation_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.7.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getVerticalSpace(6.7.h),
              Text(
                "Welcome Back!",
                textAlign: TextAlign.center,
                style: Constant.buttonText.copyWith(
                    fontSize: 20.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff444444),
                    fontFamily: 'bold'),
              ),
              getVerticalSpace(.6.h),
              Text(
                "Please enter the required details",
                textAlign: TextAlign.center,
                style: Constant.buttonText.copyWith(
                    fontSize: 12.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff444444),
                    fontFamily: 'medium'),
              ),
              getVerticalSpace(4.h),
              SvgPicture.asset('assets/svg/applogo.svg'),
              getVerticalSpace(1.2.h),
              Text(
                'Villemara',
                style: Constant.headingText1,
              ),
              getVerticalSpace(3.h),
              CustomTextFormField(
                hintText: 'Email',
                prefixIcon: SvgPicture.asset('assets/svg/emailicon.svg'),
              ),
              getVerticalSpace(2.h),
              CustomTextFormField(
                hintText: 'Password',
                prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
              ),
              getVerticalSpace(1.h),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgetScreen());
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color(0xff1E1E1E),
                        fontFamily: 'medium',
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              getVerticalSpace(4.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(()=>const BottomNavigationScreen());
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
                          'Log In',
                          style:
                              Constant.buttonText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  getHorizontalSpace(.5.h),
                  GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: SvgPicture.asset('assets/svg/mediumfnger.svg'))
                ],
              ),
              getVerticalSpace(4.h),
              GestureDetector(onTap: (){
                Get.to(()=>const SignUpScreen());
              },
                child: RichText(text: TextSpan(children: [
                  TextSpan(text: 'Don’t have an account? ',style: TextStyle(
                    fontWeight:FontWeight.w400 ,
                     fontSize: 12.px,
                    fontFamily: 'medium',
                     color: const Color(0xff7A7A7A)
                  )),
                  TextSpan(text: 'Sign Up',style: TextStyle(
                      fontWeight:FontWeight.w400 ,
                      fontSize: 12.px,
                      fontFamily: 'bold',
                      color: const Color(0xff1E1E1E)
                  ))
                ])),
              )
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
                        Get.to(() => const EmailConfirmation());
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
