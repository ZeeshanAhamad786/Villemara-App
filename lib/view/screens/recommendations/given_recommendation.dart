import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/recommendations/give_recommendation_screen.dart';

import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/customtextfield.dart';
import '../../../controller/custom_widgets/my_color.dart';
import '../../../model/recommendation_model.dart';
class GivenRecommendationScreen extends StatefulWidget {
  const GivenRecommendationScreen({super.key});

  @override
  State<GivenRecommendationScreen> createState() => _GivenRecommendationScreenState();
}

class _GivenRecommendationScreenState extends State<GivenRecommendationScreen> {
  List<RecommendationModel> recommendData=[
    RecommendationModel(profileImage: 'assets/png/recommendProfile.png', profileName: 'Theo Champion',
        profileTitle: 'Back-end developer at MyDodow', profileDescription: 'Lorem ipsum dolor sit amet consectetur. Erat convallis non tortor tortor at dolor aliquam. Sed sollicitudin amet enim mattis nisl. Pulvinar bibendum tempor in egestas nisl sagittis.',
        profileDate: '2021.03.02'),
    RecommendationModel(profileImage: 'assets/png/recommendProfile.png', profileName: 'Theo Champion',
        profileTitle: 'Back-end developer at MyDodow', profileDescription: 'Lorem ipsum dolor sit amet consectetur. Erat convallis non tortor tortor at dolor aliquam. Sed sollicitudin amet enim mattis nisl. Pulvinar bibendum tempor in egestas nisl sagittis.',
        profileDate: '2021.03.02'),
    RecommendationModel(profileImage: 'assets/png/recommendProfile.png', profileName: 'Theo Champion',
        profileTitle: 'Back-end developer at MyDodow', profileDescription: 'Lorem ipsum dolor sit amet consectetur. Erat convallis non tortor tortor at dolor aliquam. Sed sollicitudin amet enim mattis nisl. Pulvinar bibendum tempor in egestas nisl sagittis.',
        profileDate: '2021.03.02'),
    RecommendationModel(profileImage: 'assets/png/recommendProfile.png', profileName: 'Theo Champion',
        profileTitle: 'Back-end developer at MyDodow', profileDescription: 'Lorem ipsum dolor sit amet consectetur. Erat convallis non tortor tortor at dolor aliquam. Sed sollicitudin amet enim mattis nisl. Pulvinar bibendum tempor in egestas nisl sagittis.',
        profileDate: '2021.03.02')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.h),
      child: Column(children: [
        getVerticalSpace(3.h),
        Expanded(
          child: GestureDetector(onTap: () {
            Get.to(()=>const GiveRecommendationScreen());
          },
            child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),

                shrinkWrap: true,
                itemCount: recommendData.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.w),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),
                          color:MyColor.white ,
                          boxShadow: [
                            BoxShadow(color: MyColor.blackBoldColor.withOpacity(0.1),
                                offset: Offset(2, 2),blurRadius: 15.4,spreadRadius: 0)
                          ]
                      ),

                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50.px,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(recommendData[index].profileImage,fit: BoxFit.cover,),
                              ),
                              getHorizontalSpace(2.w),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(recommendData[index].profileName,style: Constant.companyName,),
                                    getVerticalSpace(0.2.h),
                                    Text(recommendData[index].profileTitle,style: Constant.designation,),
                                    getVerticalSpace(1.h),
                                    Text(recommendData[index].profileDescription,style: Constant.currentJob,),
                                    getVerticalSpace(1.h),
                                    Text(recommendData[index].profileDate,style: Constant.currentJob,)
                                  ],
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],),
    ),);
  }
}
