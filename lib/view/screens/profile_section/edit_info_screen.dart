import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/custom_text_form_feld.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/view/screens/authentication_screens/fingerprint_authentication.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSelected=false.obs;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.6.h),
          child: Column(
            children: [
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
                        size: 2.3.h,
                      )),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 20.h,
                    child: Text(
                      'Edit info',
                      textAlign: TextAlign.center,
                      style: Constant.headingText,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              getVerticalSpace(3.h),
              CustomTextFormField(
                hintText: 'Name',
                prefixIcon: SvgPicture.asset('assets/svg/nameicon.svg'),
                readOnly: false,
              ),
              getVerticalSpace(2.h),
              CustomTextFormField(
                hintText: 'Headline',
                prefixIcon: SvgPicture.asset('assets/svg/headlines.svg'),
                readOnly: false,
              ),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Company Name',
                  prefixIcon: SvgPicture.asset('assets/svg/company.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Add link of your LinkedIn Account',
                  prefixIcon: SvgPicture.asset('assets/svg/linkden.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Add link of your Instagram Account',
                  prefixIcon: SvgPicture.asset('assets/svg/Instagram.svg'),
                  readOnly: false),
              getVerticalSpace(2.h),
              CustomTextFormField(
                  hintText: 'Add link of your Facebook Account',
                  prefixIcon: SvgPicture.asset('assets/svg/facebook.svg'),
                  readOnly: false),
              // CustomTextFormField(
              //   onTap: (){
              //     Get.to(()=>const FingerPrintAuthentication());
              //   },
              //     hintText: 'Add Fingerprint Authentication',
              //     prefixIcon: SvgPicture.asset('assets/svg/fngerprnt.svg'),
              //     suffixIcon: Text(
              //       'Update',
              //       style: TextStyle(
              //           fontSize: 33.px,
              //           fontFamily: 'medium',
              //           fontWeight: FontWeight.w400,
              //           color: const Color(0xff1E1E1E)),
              //     ),
              //     readOnly: true),
              getVerticalSpace(2.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.9.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: const Color(0xffF8F8F8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Book Appointment',
                      style: TextStyle(
                          color: const Color(0xffA7A7A7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px),
                    ),
                    GestureDetector(onTap: (){
                      if(isSelected.value==false){
                        isSelected.value=true;

                      }else{
                        isSelected.value=false;

                      }
                    },
                      child: Obx(()=>
                         Container(padding: EdgeInsets.all(.3.h),
                           alignment:isSelected.value==true? Alignment.centerRight:
                          Alignment.centerLeft,
                          height: 2.5.h,
                          width: 4.5.h,
                          decoration: BoxDecoration(borderRadius:
                          BorderRadius.circular(2.h),
                          color: Colors.green),
                          child:  CircleAvatar(backgroundColor: Colors.white,
                          radius: 1.h,),

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
