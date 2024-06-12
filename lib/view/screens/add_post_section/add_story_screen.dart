import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/add_post_section/play_story_screen.dart';

import 'live_stream_screen.dart';

class AddStoryScreen extends StatelessWidget {
  AddStoryScreen({super.key});
  final RxInt selectedCategory = 0.obs;
  final RxList<String> categoryList = <String>[
    'Selling',
    'Renting',
    'developments',
    'joint ventures',
    'special purpose vehicles'
  ].obs;
  final RxList<String> imagesList = <String>[
    'assets/svg/pcmage.svg',
    'assets/svg/play.svg',
    'assets/svg/golive.svg'
  ].obs;
  final RxList<String> mediaName = <String>['Image', 'Video', 'Go Live'].obs;
  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.5.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  'Add Story',
                  style: Constant.headingText,
                ),
               getVerticalSpace(4.h),


                SizedBox(
                  height: 8.h,
                  child: ListView.builder(
                    itemCount: imagesList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.2.h),
                        child: GestureDetector(onTap: (){
                          if(index==2){
                            Get.to(()=>GoToLive());

                          }
                        },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                0.8.h), // 10% of the height (8.h)
                            child: DottedBorder(
                              dashPattern: const [10, 10],
                              color: MyColor.blackBoldColor,
                              strokeWidth: 3,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(
                                  1.8.h), // 10% of the height (8.h)
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.8.h, vertical: 1.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(imagesList[index]),
                                    Text(
                                      mediaName[index],
                                      style: Constant.simpleText,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                getVerticalSpace(4.h),

                customTextField('Type Something..', descriptionController),
                getVerticalSpace(4.h),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.7.h, vertical: 1.1.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            border: Border.all(color: MyColor.blackBoldColor)),
                        child: Text(
                          'Cancel',
                          style: Constant.buttonText
                              .copyWith(color: MyColor.blackBoldColor),
                        ),
                      ),
                    ),
                    getHorizontalSpace(1.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=>PlayStoryScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.h, vertical: 1.1.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColor.blackBoldColor,
                            borderRadius: BorderRadius.circular(10.h),
                            border: Border.all(color: MyColor.blackBoldColor)),
                        child: Text(
                          'Done',
                          style:
                          Constant.buttonText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                getVerticalSpace(4.5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
