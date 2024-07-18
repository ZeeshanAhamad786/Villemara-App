import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/utils/my_color.dart';
import 'package:villemara_app/view/screens/subscription/add_amount.dart';

import '../../../controller/custom_button.dart';
import '../../../controller/utils/constant.dart';
import '../../../model/subscription_model.dart';
class PremiumSubscription extends StatefulWidget {
  const PremiumSubscription({Key? key}) : super(key: key);

  @override
  State<PremiumSubscription> createState() => _PremiumSubscriptionState();
}

class _PremiumSubscriptionState extends State<PremiumSubscription> {
  List <PremiumSubscriptionModel> data=[
    PremiumSubscriptionModel(imageUrl: 'assets/png/premiumBackground.png',
        plan: 'Basic Plan', amount: 'Free',
        description: 'Each member is entitled to receive 5 massages per month and 1 listing per year.',
        buttonText: 'Activated'),
    PremiumSubscriptionModel(imageUrl: 'assets/png/premiumBackground.png',
        plan: 'Basic Plan', amount: '£7.99',
        description: 'Each member is entitled to receive 5 massages per month and 1 listing per year.',
        buttonText: 'Buy PLan'),
    PremiumSubscriptionModel(imageUrl: 'assets/png/premiumBackground.png',
        plan: 'Basic Plan', amount: '£79.99',
        description: 'Each member is entitled to receive 5 massages per month and 1 listing per year.',
        buttonText: 'Buy PLan')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text("Premium Subscription", style: Constant.projectTitle),
            SizedBox(height: 20,width: 20,)

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
                Stack(children: [
                  ListView.builder(
                    itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                    return Container(
                             margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.h),
                      padding:  EdgeInsets.symmetric(horizontal:3.h,vertical: 3.h),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: MyColor.blackBoldColor.withOpacity(0.1),blurRadius: 13,
                                spreadRadius: 0,offset: Offset(0, 0)),
                          ],
                          image: const DecorationImage(image: AssetImage("assets/png/premiumBackground.png"),
                              fit: BoxFit.cover, opacity: 0.1)),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data[index].plan,style: Constant.basicPlan,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 0.8.h),
                                decoration: const BoxDecoration(color:MyColor.textBlue,borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)) ),
                                  child: Text(data[index].amount,style: Constant.free)),
                            ],
                          ),
                          Text(data[index].description,style: Constant.planDesc,),
                          GestureDetector(onTap: () {
                            Get.to(()=>const AddPaymentMethod());
                          },
                              child: CustomButton(text: data[index].buttonText, ))
                        ],
                      ),
                    );
                  })
                ],)
        ],),
      ),
    );
  }
}
