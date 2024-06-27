
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/custom_text_form_feld.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/authentication_screens/login_screen.dart';

import 'facerecognization_screen.dart';

class SignUpScreen extends StatefulWidget {
   const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

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
              SvgPicture.asset('assets/svg/applogo.svg'),
              getVerticalSpace(1.2.h),
              Text(
                'Villemara',
                style: Constant.headingText1,
              ),
              getVerticalSpace(3.h),
              Text(
                "Registration",
                textAlign: TextAlign.center,
                style: Constant.buttonText.copyWith(
                    fontSize: 18.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff444444)),
              ),
              getVerticalSpace(1.h),
              Text(
                "Please enter the required details",
                textAlign: TextAlign.center,
                style: Constant.buttonText.copyWith(
                    fontSize: 12.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff444444)),
              ),
              getVerticalSpace(3.h),
              CustomTextFormField(
                  hintText: 'First Name',
                  prefixIcon: SvgPicture.asset('assets/svg/nameicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Last Name',
                  prefixIcon: SvgPicture.asset('assets/svg/nameicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Email',
                  prefixIcon: SvgPicture.asset('assets/svg/emailicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Confirm Email',
                  prefixIcon: SvgPicture.asset('assets/svg/emailicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Password',
                  prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
                  suffixIcon: SvgPicture.asset('assets/svg/eye-off.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Confirm Password',
                  prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
                  suffixIcon: SvgPicture.asset('assets/svg/eye-off.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Company House No.',
                  prefixIcon: SvgPicture.asset('assets/svg/company.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const FaceRecognization());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.8.h, vertical: 1.3.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: const Color(0xffF8F8F8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/facerecog.svg'),
                      getHorizontalSpace(1.h),
                      Text(
                        'Face Recognition',
                        style: TextStyle(
                            color: const Color(0xffA7A7A7),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.px),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,size: 14.px,)
                    ],
                  ),
                ),
              ),
              getVerticalSpace(3.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.2.h, vertical: 1.1.h),
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
              getVerticalSpace(4.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px,
                          fontFamily: 'medium',
                          color: const Color(0xff7A7A7A))),
                  TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px,
                          fontFamily: 'bold',
                          color: const Color(0xff1E1E1E)))
                ])),
              ),
              getVerticalSpace(3.h)
            ],
          ),
        ),
      ),
    );
  }

  // void showAlertDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Center(
  //         child: Material(
  //           color: Colors.transparent, // Transparent background for Material
  //           child: Container(
  //             height: 43.h,
  //             width: 33.2.h,
  //             padding: EdgeInsets.symmetric(horizontal: 4.4.h, vertical: 2.8.h),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(3.5.h),
  //               color: Colors.white,
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   "Fingerprint Authentication",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     color: const Color(0xff444444),
  //                     fontSize: 18.px,
  //                     fontFamily: 'medium',
  //                     fontWeight: FontWeight.w400,
  //                   ),
  //                 ),
  //                 getVerticalSpace(1.h),
  //                 Text(
  //                   'Hold on to your mobile fingerprint sensor to activate.',
  //                   textAlign: TextAlign.center,
  //                   style: Constant.buttonText.copyWith(
  //                       color: const Color(0xff717171),
  //                       fontWeight: FontWeight.w600,
  //                       fontFamily: 'regular'),
  //                 ),
  //                 getVerticalSpace(3.h),
  //                 GestureDetector(
  //                     onTap: () {
  //                       Get.to(() => const EmailConfirmation());
  //                     },
  //                     child: SvgPicture.asset('assets/svg/finger.svg'))
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
