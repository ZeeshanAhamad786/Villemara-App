import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/authentication_screens/login_screen.dart';

import '../../../controller/api/auth_apis.dart';
import '../../../controller/getx_controllers/auth_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/custom_text_form_feld.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late AuthController authController;
  late AuthApis authApis;
  final TextEditingController newPasswordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController = Get.put(AuthController(context));
    authApis = AuthApis(context);
  }
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
              "Create New Password",
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
              controller: newPasswordController,
              hintText: 'New Password',readOnly: false,
              prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
            ),
            getVerticalSpace(1.5.h),
            CustomTextFormField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',readOnly: false,
              prefixIcon: SvgPicture.asset('assets/svg/passwordicon.svg'),
            ),
            getVerticalSpace(3.h),
     Obx(() =>    authController.isLoading.value?const Center(child: CircularProgressIndicator(color: MyColor.blackBold,)):
     GestureDetector(
       onTap: () {
         authController.createNewPassword(context,newPasswordController.text,);
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
     ),)

          ],),
      ),
    );
  }
}
