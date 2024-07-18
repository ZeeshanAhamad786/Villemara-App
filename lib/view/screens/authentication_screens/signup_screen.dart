import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/api/auth_apis.dart';
import 'package:villemara_app/controller/utils/validations.dart';
import 'package:villemara_app/view/screens/authentication_screens/login_screen.dart';
import '../../../controller/custom_button.dart';
import '../../../controller/getx_controllers/auth_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/custom_text_form_feld.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
import 'facerecognization_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthController authController;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController confirmEmailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();
 final TextEditingController confirmPasswordController = TextEditingController();
 final TextEditingController companyHouseNoController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController = Get.put(AuthController(context));
  }

  @override
  Widget build(BuildContext context) {
    return
    Obx(() =>   Scaffold(
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
                  controller: firstNameController,
                  hintText: 'First Name',
                  prefixIcon: SvgPicture.asset('assets/svg/nameicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  controller: lastNameController,
                  hintText: 'Last Name',
                  prefixIcon: SvgPicture.asset('assets/svg/nameicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: SvgPicture.asset('assets/svg/emailicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  controller: confirmEmailController,
                  hintText: 'Confirm Email',
                  prefixIcon: SvgPicture.asset('assets/svg/emailicon.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
                  suffixIcon: SvgPicture.asset('assets/svg/eye-off.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
                  suffixIcon: SvgPicture.asset('assets/svg/eye-off.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  controller: companyHouseNoController,
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
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14.px,
                      )
                    ],
                  ),
                ),
              ),
              getVerticalSpace(3.h),
              authController.isLoading.value?const Center(child: CircularProgressIndicator(color: Colors.black,))
                  : GestureDetector(
                onTap: () {
                  if (Validations.handleSignUpScreenError(
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      confirmEmailController: confirmEmailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      companyHouseNoController: companyHouseNoController)
                      .isNotEmpty) {
                    customScaffoldMessenger(context,
                        Validations.handleSignUpScreenError(
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            emailController: emailController,
                            confirmEmailController: confirmEmailController,
                            passwordController: passwordController,
                            confirmPasswordController: confirmPasswordController,
                            companyHouseNoController: companyHouseNoController));

                  }else{
                    authController.userRegistered(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        confirmEmail: confirmEmailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                        companyHouseNo: companyHouseNoController.text);
                  }

                  // Get.to(() => const LoginScreen());
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
                  Get.to(() =>  LoginScreen());
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
    ));
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
