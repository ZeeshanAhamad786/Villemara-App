import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
import 'add_story_screen.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
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
    final TextEditingController locationController = TextEditingController();
    final TextEditingController tagSomeoneController = TextEditingController();
    final TextEditingController addTagController = TextEditingController();
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
                  'Add Post',
                  style: Constant.headingText,
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(onTap: (){
                  Get.to(()=>AddStoryScreen());
                },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.2.h, vertical: 1.4.h),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.h),
                        color: MyColor.buttonColor),
                    child: Text(
                      'Share your thoughts...',
                      style: Constant.buttonText,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 8.h,
                  child: ListView.builder(
                    itemCount: imagesList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.2.h),
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
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
                  decoration: BoxDecoration(
                      color: MyColor.buttonColor,
                      borderRadius: BorderRadiusDirectional.circular(2.h)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose Category(Optional)',
                            style:
                                Constant.buttonText.copyWith(fontSize: 14.px),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 2.9.h,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.4.h),
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  selectedCategory.value = index;
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          categoryList[index],
                                          style: Constant.buttonText
                                              .copyWith(fontSize: 12.px),
                                        ),
                                        selectedCategory.value == index
                                            ? SvgPicture.asset(
                                                'assets/svg/tick.svg')
                                            : Container(
                                                height: 2.h,
                                                width: 2.h,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: MyColor
                                                            .blackBoldColor)),
                                              )
                                      ],
                                    ),
                                    const Divider(
                                      color: Color(0xffE3E3E3),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                getVerticalSpace(2.h),
                customTextField('Location', locationController),
                SizedBox(
                  height: 2.h,
                ),
                customTextField('Tag Someone', tagSomeoneController),
                SizedBox(
                  height: 2.h,
                ),
                customTextField('Add Tags(Optional)', addTagController),
                getVerticalSpace(3.h),
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
                      onTap: () {},
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
