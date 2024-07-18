import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constant.dart';
import 'my_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final bool? phoneKeyboard;
  final double? borderRadius;
  final double? horizentalPadding;
  final Callback? onTap;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.phoneKeyboard, this.borderRadius, this.horizentalPadding, required this.readOnly, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(padding: EdgeInsets.symmetric(horizontal:horizentalPadding?? 1.2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: const Color(0xffF8F8F8),
      ),
      child: TextFormField(
        onTap:onTap ,
        keyboardType: phoneKeyboard == true ? TextInputType.phone : null,
        controller: controller,
        style: Constant.buttonText.copyWith(color: const Color(0xff444444)),
        // controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        readOnly: readOnly,
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xffA7A7A7),
             fontWeight: FontWeight.w400,
            fontSize: 12.px
          ),
          contentPadding:  EdgeInsets.symmetric(horizontal:0.h,vertical: 1.9.h),
          prefixIcon: Transform.scale(
            scale: 0.4,
            child: prefixIcon,
          ),
          suffixIcon: Transform.scale(
            scale: 0.4,
            child: suffixIcon,
          ),
          // isDense: true,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius??36),
            borderSide: const BorderSide(color: MyColor.simpleTextColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.h),
            borderSide: BorderSide.none
          ),
          enabledBorder:  InputBorder.none
        ),
      ),
    );
  }
}