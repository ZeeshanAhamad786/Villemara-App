import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

class CreateNewProject extends StatelessWidget {
  const CreateNewProject({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.6.h),
          child: Column(children: [
            getVerticalSpace(6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 2.4.h,
                    )),
                const Expanded(child: SizedBox()),
                Text(
                  'New Project',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'medium',
                      color: const Color(0xff050505),
                      fontWeight: FontWeight.w400,
                      fontSize: 18.px),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            getVerticalSpace(4.h),
            DottedBorder(
              dashPattern: const [10, 10],
              color: MyColor.blackBoldColor,
              strokeWidth: 3,
              borderType: BorderType.RRect,
              radius: Radius.circular(
                  1.h), // 10% of the height (8.h)
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.5.h, vertical: 4.2.h),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/Picture.svg'),
                    getVerticalSpace(.3.h),
                    Text('Choose Images/Video',style: TextStyle(
                      fontFamily: 'medium',
                      fontSize:13.px ,
                       fontWeight:FontWeight.w400 ,
                      color: const Color(0xff444444)
                    ),textAlign: TextAlign.center),
                    getVerticalSpace(.3.h),
                    Text('You can multiple  Images and Videos',style: TextStyle(
                        fontFamily: 'medium',
                        fontSize:10.px ,
                        fontWeight:FontWeight.w400 ,
                        color: const Color(0xffBCBCBC)
                    ),textAlign: TextAlign.center,)

                  ],
                ),
              ),
            ),
            getVerticalSpace(2.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: const Color(0xffF8F8F8),
              ),
              child: TextFormField(
                style: Constant.buttonText.copyWith(color: const Color(0xffA7A7A7)),

                cursorColor: Colors.black,

                decoration: InputDecoration(

                    hintText: 'Description',
                    hintStyle: TextStyle(
                        color: const Color(0xffA7A7A7),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px
                    ),
                    contentPadding:  EdgeInsets.symmetric(horizontal:2.2.h,vertical: 1.9.h),



                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(36),
                      borderSide: const BorderSide(color: MyColor.simpleTextColor),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.h),
                        borderSide: BorderSide.none
                    ),
                    enabledBorder:  InputBorder.none
                ),
              ),
            ),
            getVerticalSpace(2.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: const Color(0xffF8F8F8),
              ),
              child: TextFormField(
                style: Constant.buttonText.copyWith(color: const Color(0xffA7A7A7)),

                cursorColor: Colors.black,

                decoration: InputDecoration(

                    hintText: 'Completion Date',
                    hintStyle: TextStyle(
                        color: const Color(0xffA7A7A7),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px
                    ),
                    contentPadding:  EdgeInsets.symmetric(horizontal:2.2.h,vertical: 1.9.h),



                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(36),
                      borderSide: const BorderSide(color: MyColor.simpleTextColor),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.h),
                        borderSide: BorderSide.none
                    ),
                    enabledBorder:  InputBorder.none
                ),
              ),
            ),
            getVerticalSpace(4.h),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(margin: EdgeInsets.symmetric(horizontal: 2.h),
                padding:
                EdgeInsets.symmetric(horizontal: 5.h, vertical: 1.1.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColor.blackBoldColor,
                    borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(color: MyColor.blackBoldColor)),
                child: Text(
                  'Done',
                  style: Constant.buttonText.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
