import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';



Widget getHorizontalSpace (double width){
  return SizedBox(width: width,);
}
Widget getVerticalSpace (double height){
  return SizedBox(height: height,);
}





class CustomFilter extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;

  CustomFilter({required this.text, required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,style: Constant.textSearch,),

            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white
            ),
          ],
        ),
        Divider(color: Colors.grey),
      ],
    );
  }
}
Widget customTextField (String title,TextEditingController controller){
  return  Container(
      padding:
      EdgeInsets.symmetric(horizontal: 2.2.h, vertical: 1.4.h),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: MyColor.buttonColor),
      child: TextFormField(
        controller: controller,
        style:Constant.textSearch.copyWith(color: const Color(0xff828282)) ,

        decoration: InputDecoration(
            isCollapsed: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.h),
                borderSide: BorderSide.none),
            hintText: title,
            hintStyle: Constant.textSearch.copyWith(color: const Color(0xff828282))

        ),
      )
  );
}
