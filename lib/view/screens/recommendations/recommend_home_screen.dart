import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/recommendations/received_recommendation.dart';
import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/customtextfield.dart';
import '../../../controller/custom_widgets/my_color.dart';
import 'given_recommendation.dart';
class RecommendHomeScreen extends StatefulWidget {
  const RecommendHomeScreen({Key? key}) : super(key: key);

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
            Text("Recommendations", style: Constant.textLikes),
            const SizedBox(height: 10, width: 10)
          ],
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
                          borderRadius: BorderRadius.only(
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
                          borderRadius: BorderRadius.only(
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
                Container(
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
