import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/customtextfield.dart';

class EmailConfirmation extends StatelessWidget {
  final String? title;
  const EmailConfirmation({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title == 'fingerAuth'
                ? Image.asset('assets/png/authentcatonsvg.png')
                : SizedBox(
                    height: 17.4.h,
                    child: SvgPicture.asset('assets/svg/verfy.svg')),
            getVerticalSpace(2.3.h),
            Text(
              title == 'fingerAuth'
                  ? "Fingerprint Authentication Updated Successfully!"
                  : "Email Confirmation",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: title == 'fingerAuth'?16.px: 20.px,
                  fontWeight: FontWeight.w400,
                  color:title=='fingerAuth'?const Color(0xff7D7D7D): const Color(0xff444444),
                  fontFamily: 'medium'),
            ),
            getVerticalSpace(.6.h),
            title == 'fingerAuth'
                ? const SizedBox.shrink()
                : Text(
                    "Please check your email to verify your registration.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12.px,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff444444),
                        fontFamily: 'medium'),
                  ),
          ],
        ),
      ),
    );
  }
}
