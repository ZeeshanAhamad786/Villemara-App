import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/utils/constant.dart';
import 'package:villemara_app/controller/utils/my_color.dart';

import '../view/screens/subscription/add_amount.dart';

class CustomButton extends StatefulWidget {
  final String text;
  CustomButton({
    required this.text,


  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
 RxBool isSelected=false.obs;
  @override
  Widget build(BuildContext context) {
    return
      Obx(() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected.value?MyColor.blackBoldColor:MyColor.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: MyColor.blackBoldColor)
          ),
          padding: EdgeInsets.all(8),
        ),
        onPressed: (){
          isSelected.value =!isSelected.value;
          Get.to(()=>const AddPaymentMethod());
        },
        child: Center(
          child: Text(
            widget.text,
            style:isSelected.value? TextStyle(color: MyColor.white,fontSize:12.px ):
            TextStyle(color: MyColor.blackBoldColor,fontSize: 12.px),
          ),
        ),
      ));
  }
}
customScaffoldMessenger(
    BuildContext context,
    String text,
    ) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 14.sp,
        ),
      ),
      backgroundColor: MyColor.blackBoldColor,
      duration: const Duration(seconds: 2),
    ),
  );
}