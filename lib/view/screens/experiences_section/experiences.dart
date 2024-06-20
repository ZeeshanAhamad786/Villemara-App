import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

class Experiences extends StatelessWidget {
  const Experiences({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: .6.h, vertical: .6.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.h),
                        color: Colors.transparent,
                        border: Border.all(color: const Color(0xff1E1E1E))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 1.8.h,
                        ),
                        Text(
                          'Add New',
                          style: TextStyle(
                              color: const Color(0xff1E1E1E),
                              fontFamily: 'medium',
                              fontSize: 10.px,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
              getVerticalSpace(3.h),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(vertical: 2.2.h),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 5.5.h,
                              width: 5.5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                              ),
                              child: SvgPicture.asset('assets/svg/miomii.svg'),
                            ),
                            getHorizontalSpace(1.1.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Miami Brokers',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.px,
                                        fontFamily: 'bold',
                                        color: const Color(0xff000000)),
                                  ),
                                  Text(
                                    'Managing Broker Present Miami ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.px,
                                        fontFamily: 'medium',
                                        color: const Color(0xffA7A7A7)),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            GestureDetector(onTap: (){
                              showAlertDialog(context);
                            },
                                child: SvgPicture.asset('assets/svg/delete.svg'))
                          ],
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a quits.Vitae id nam eros elit eu tempor cursus a quits.',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.px,
                              fontFamily: 'medium',
                              color: const Color(0xffA7A7A7)),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              height: 26.h,
              width: 43.2.h,
              padding: EdgeInsets.symmetric(horizontal: 4.4.h, vertical: 2.8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5.h),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 5.2.h,
                          width: 5.2.h,
                          child: SvgPicture.asset(
                            'assets/svg/deletealert.svg',
                            fit: BoxFit.cover,
                          )),
                      getHorizontalSpace(2.h),
                      Text(
                        'Delete Story',
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: 16.px,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  getVerticalSpace(2.5.h),
                  Text(
                    'Are you sure you want to Delete this Post?',
                    style: Constant.buttonText
                        .copyWith(color: const Color(0xff222222),
                        fontWeight: FontWeight.w600),
                  ),
                  getVerticalSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            border: Border.all(color: const Color(0xffA0A0A0)),
                          ),
                          child: Text(
                            'No',
                            style: Constant.buttonText
                                .copyWith(color:  const Color(0xffA0A0A0)),
                          ),
                        ),
                      ),
                      getHorizontalSpace(1.h),// Replaced custom method with SizedBox for simplicity
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffF20707),
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Text(
                            'Yes',
                            style: Constant.buttonText
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
