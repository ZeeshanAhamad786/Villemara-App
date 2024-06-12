import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

class EmailConfirmation extends StatelessWidget {
  const EmailConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(padding: EdgeInsets.symmetric(horizontal: 10.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 17.4.h,
              child: SvgPicture.asset('assets/svg/verfy.svg')),
            getVerticalSpace(2.3.h),
            Text(
              "Email Confirmation",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.px, fontWeight: FontWeight.w400,color: const Color(0xff444444),fontFamily: 'medium'),
            ),
            getVerticalSpace(.6.h),
            Text(
              "Please check your email to verify your registration.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.px, fontWeight: FontWeight.w400,color: const Color(0xff444444),fontFamily: 'medium'),
            ),
        ],),
      ),
    );
  }
}
