import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/recommendations/received_recommendation.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
import 'give_recommendation_screen.dart';
import 'given_recommendation.dart';
class RecommendHomeScreen extends StatefulWidget {
  const RecommendHomeScreen({super.key});

  @override
  State<RecommendHomeScreen> createState() => _RecommendHomeScreenState();
}

class _RecommendHomeScreenState extends State<RecommendHomeScreen> {
  RxBool isSelected = false.obs;
  RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new, size: 18.px)),
            const Expanded(child: SizedBox()),

            Text("Appreciations", style: Constant.textLikes),
            const Expanded(child: SizedBox()),
            GestureDetector(onTap: ()
            {
              Get.to(()=>const GiveRecommendationScreen());
            },
              child: Container(
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
              ),
            )          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          getVerticalSpace(2.h),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Obx(() => Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectedIndex.value = 0;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIndex.value == 0 ? Colors.black :MyColor.textDarkGrey,
                          borderRadius:const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.px,horizontal: 8.w),
                        child: Center(
                          child: Text(
                            'Received',
                            style: TextStyle(
                                color: selectedIndex.value == 0 ? Colors.white : MyColor.choosePerson
                            ),
                          ),
                        ),
                      ),
                    ),
                    getHorizontalSpace(2.w),
                    GestureDetector(
                      onTap: () {
                        selectedIndex.value = 1;
                      },
                      child: Container(

                        decoration: BoxDecoration(
                          color: selectedIndex.value == 1 ? Colors.black : MyColor.textDarkGrey,
                          borderRadius:const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10.px,horizontal: 10.w),
                        child: Center(
                          child: Text(
                            'Given',
                            style: TextStyle(
                                color: selectedIndex.value == 1 ? Colors.white : MyColor.choosePerson
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.height ,
                  child: Obx(() {
                    return selectedIndex.value == 0
                        ? const ReceivedRecommendationScreen()
                        : const GivenRecommendationScreen();
                  }),
                ),
              ],
            ),
          )
        ],),
      ),
    );
  }
}
