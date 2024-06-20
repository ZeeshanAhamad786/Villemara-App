import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/experiences_section/experiences.dart';

class AddNewExperience extends StatelessWidget {
   AddNewExperience({super.key});
   final Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
  @override
  Widget build(BuildContext context) {
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
                        size: 2.4.h,
                      )),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Add Experience',
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: const Color(0xffF8F8F8),
                ),
                child: TextFormField(
                  style: Constant.buttonText
                      .copyWith(color: const Color(0xffA7A7A7)),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Company Name',
                      hintStyle: TextStyle(
                          color: const Color(0xffA7A7A7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.2.h, vertical: 1.9.h),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide:
                            const BorderSide(color: MyColor.simpleTextColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                          borderSide: BorderSide.none),
                      enabledBorder: InputBorder.none),
                ),
              ),
              getVerticalSpace(2.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: const Color(0xffF8F8F8),
                ),
                child: TextFormField(
                  style: Constant.buttonText
                      .copyWith(color: const Color(0xffA7A7A7)),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Designation',
                      hintStyle: TextStyle(
                          color: const Color(0xffA7A7A7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.2.h, vertical: 1.9.h),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide:
                            const BorderSide(color: MyColor.simpleTextColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                          borderSide: BorderSide.none),
                      enabledBorder: InputBorder.none),
                ),
              ),
              getVerticalSpace(2.h),
              Row(
                children: [
                  Expanded(
                    child: Obx(()=>
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: const Color(0xffF8F8F8),
                          ),
                          child: TextFormField(
                            readOnly: true,
                            onTap: (){
                              selectDate(context);
                            },
                            style: Constant.buttonText
                                .copyWith(color: const Color(0xffA7A7A7)),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: DateFormat('dd/MM/yyyy').format(selectedDate.value),
                                hintStyle: TextStyle(
                                    color: const Color(0xffA7A7A7),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.px),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 2.2.h, vertical: 1.9.h),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(36),
                                  borderSide: const BorderSide(
                                      color: MyColor.simpleTextColor),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3.h),
                                    borderSide: BorderSide.none),
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.h),
                    child: Text(
                      'Till',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffB0B0B0),
                        fontSize: 14.px,
                        fontFamily: 'medium',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(()=>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: const Color(0xffF8F8F8),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          onTap: (){
                            selectDate(context);
                          },
                          style: Constant.buttonText
                              .copyWith(color: const Color(0xffA7A7A7)),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: DateFormat('dd/MM/yyyy').format(selectedDate.value),
                              hintStyle: TextStyle(
                                  color: const Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.px),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 2.2.h, vertical: 1.9.h),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(36),
                                borderSide: const BorderSide(
                                    color: MyColor.simpleTextColor),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.h),
                                  borderSide: BorderSide.none),
                              enabledBorder: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              getVerticalSpace(2.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: const Color(0xffF8F8F8),
                ),
                child: TextFormField(
                  style: Constant.buttonText
                      .copyWith(color: const Color(0xffA7A7A7)),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Location',
                      hintStyle: TextStyle(
                          color: const Color(0xffA7A7A7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.2.h, vertical: 1.9.h),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide:
                        const BorderSide(color: MyColor.simpleTextColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                          borderSide: BorderSide.none),
                      enabledBorder: InputBorder.none),
                ),
              ),
              getVerticalSpace(2.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  color: const Color(0xffF8F8F8),
                ),
                child: TextFormField(
                  style: Constant.buttonText
                      .copyWith(color: const Color(0xffA7A7A7)),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Job Description',
                      hintStyle: TextStyle(
                          color: const Color(0xffA7A7A7),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.px),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.2.h, vertical: 1.9.h),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(36),
                        borderSide:
                        const BorderSide(color: MyColor.simpleTextColor),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.h),
                          borderSide: BorderSide.none),
                      enabledBorder: InputBorder.none),
                ),
              ),
              getVerticalSpace(4.h),
              GestureDetector(
                onTap: () {
                  Get.to(()=>const Experiences());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.h),
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
            ],
          ),
        ),
      ),
    );
  }
}
