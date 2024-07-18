import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constant.dart';
import 'my_color.dart';

Widget getHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget getVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

class CustomFilter extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;

  CustomFilter(
      {required this.text, required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Constant.textSearch,
            ),
            Icon(icon, color: isSelected ? Colors.black : Colors.white),
          ],
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}

Widget customTextField(String title, TextEditingController controller,
    {Color? hintColor, containerColor, borderColor,textColor, Widget? suffixIcon}) {
  return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: containerColor ?? MyColor.buttonColor),
      child: TextFormField(
        controller: controller,
        style: Constant.textSearch.copyWith(color:textColor?? const Color(0xff828282)),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 1.4.h, vertical: 1.4.h),

          isCollapsed: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide.none),
          hintText: title,
          hintStyle: Constant.textSearch
              .copyWith(color: hintColor ?? const Color(0xff828282)),
            suffixIcon:suffixIcon
        ),
      ));
}

Widget customTextFormField({
  String? title,
  TextEditingController? controller,
  TextInputType? keyboardType,
  int? maxLine,
  String? errorText,
  Color? focusBorderColor,
  Color? bgColor,
  Color? borderColor,
}) {
  return TextFormField(
    maxLines: maxLine,
    keyboardType: keyboardType,
    controller: controller,
    decoration: InputDecoration(
      hintText: title,
      // hintStyle: CustomTextStyles.hintTextStyle,
      isCollapsed: true,
      labelText: errorText,
      labelStyle: TextStyle(
        fontSize: 15.sp,
        color: const Color(0xff808080),
        fontWeight: FontWeight.w400,
        fontFamily: 'regular',
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusBorderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(1.h),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(color:borderColor?? Colors.transparent),
        borderRadius: BorderRadius.circular(1.h),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.h),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      filled: true,
      fillColor: bgColor ?? MyColor.choosePerson,
      contentPadding: EdgeInsets.symmetric(horizontal: 1.6.h, vertical: 1.h),
    ),
  );
}