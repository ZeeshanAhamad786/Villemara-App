import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/utils/my_color.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
class AddPaymentMethod extends StatefulWidget {
  const AddPaymentMethod({super.key});

  @override
  State<AddPaymentMethod> createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  @override
  Widget build(BuildContext context) {
    RxList<String> svgsList = <String>[
      'assets/png/visa.png',
      'assets/png/jazz.png',
      'assets/png/apple.png',
    ].obs;

    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new, size: 18.px),
            ),
            Text("Add Amount", style: Constant.projectTitle),
            SizedBox(height: 20,width: 20,)

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerticalSpace(6.h),
              SizedBox(
                height: 4.2.h,
                child: ListView.builder(
                  itemCount: svgsList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 1.6.h),
                      padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .6.h),
                      decoration: BoxDecoration(color: MyColor.white,
                          boxShadow: [
                        BoxShadow(color: MyColor.blackBoldColor.withOpacity(0.1),
                            offset: Offset(2, 2),blurRadius: 12,spreadRadius: 0)
                      ]),
                      child: Image.asset(
                        svgsList[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              getVerticalSpace(3.4.h),
              Text(
                'Name on card',
                // style: CustomTextStyles.hintTextStyle.copyWith(fontFamily: 'bold',fontSize: 16.px)
                //     .copyWith(color: const Color(0xff000000)),
              ),
              getVerticalSpace(.8.h),
              customTextFormField(
                  keyboardType: TextInputType.name,
                  title: 'Name'
              ),
              getVerticalSpace(3.1.h),
              Text(
                'Card Number',
                // style: CustomTextStyles.hintTextStyle.copyWith(fontFamily: 'bold',fontSize: 16.px)
                //     .copyWith(color: const Color(0xff000000)),
              ),
              getVerticalSpace(.8.h),
              customTextFormField(
                  keyboardType: TextInputType.number
                  ,
                  title: 'XXXX   XXXX   XXXX   XXXX'
              ),
              getVerticalSpace(2.6.h),

              Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'expiry date',
                        // style: CustomTextStyles.hintTextStyle.copyWith(fontFamily: 'bold',fontSize: 16.px)
                        //     .copyWith(color: const Color(0xff000000)),
                      ),
                      getVerticalSpace(.8.h),
                      customTextFormField(
                          keyboardType: TextInputType.number
                          ,
                          title: 'MM/YY'
                      ),
                    ],),
                ),
                getHorizontalSpace(2.h),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text(
                      'Security code',
                      // style: CustomTextStyles.hintTextStyle.copyWith(fontFamily: 'bold',fontSize: 16.px)
                      //     .copyWith(color: const Color(0xff000000)),
                    ),
                    getVerticalSpace(.8.h),
                    customTextFormField(
                        keyboardType: TextInputType.number
                        ,
                        title: 'CVV'
                    ),
                  ],),
                )
              ],),
              getVerticalSpace(12.h),
              // Align(
              //   alignment: Alignment.center,
              //   child: customElevatedButton(
              //       title: 'Proceed',
              //       onTap: () {
              //         Get.to(()=>const LogOutScreen());
              //       },
              //       bgColor: AppColors.mainColor,
              //       titleColor: AppColors.whiteColor,
              //       verticalPadding: 2.3.h,
              //       horizentalPadding: 12.1.h),
              // )
            ],
          ),
        ),
      ),
    );
  }
}