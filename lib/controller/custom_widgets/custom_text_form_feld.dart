import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

import 'constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final bool? phoneKeyboard;
  final double? borderRadius;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.phoneKeyboard, this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(horizontal: 1.2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: const Color(0xffF8F8F8),
      ),
      child: TextFormField(
        keyboardType: phoneKeyboard == true ? TextInputType.phone : null,
        controller: controller,
        style: Constant.buttonText.copyWith(color: const Color(0xffA7A7A7)),
        // controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black, // Replace with your AppColors.mainColor
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xffA7A7A7),
             fontWeight: FontWeight.w400,
            fontSize: 12.px
          ),
          contentPadding:  EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.9.h),
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