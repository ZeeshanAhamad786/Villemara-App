import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/getx_controllers/auth_controller.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/image_pick_controller.dart';
import '../../../controller/utils/my_color.dart';
import 'live_stream1.dart';

class UploadPostsTabBar extends StatefulWidget {
  const UploadPostsTabBar({super.key});

  @override
  State<UploadPostsTabBar> createState() => _UploadPostsTabBarState();
}

class _UploadPostsTabBarState extends State<UploadPostsTabBar> {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
  late AuthController authController;
  final TextEditingController thoughtsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController tagSomeoneController = TextEditingController();
  final TextEditingController addTagController = TextEditingController();
 RxBool isImageSelected=false.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController = Get.put(AuthController(context));
  }
  @override
  Widget build(BuildContext context) {
    final RxList<String> mediaName = <String>['Image', 'Video', 'Go Live'].obs;

    final RxString selectedTab = 'Posts'.obs;
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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                getVerticalSpace(7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'Upload',
                      style: Constant.headingText.copyWith(
                          color: const Color(0xff000E08),
                          fontSize: 12.px,
                          fontWeight: FontWeight.w400),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
                getVerticalSpace(3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        selectedTab.value = 'Posts';
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.h, vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.h),
                              bottomLeft: Radius.circular(10.h),
                            ),
                            color: selectedTab.value == 'Posts'
                                ? MyColor.blackBoldColor
                                : const Color(0xffE2E2E2)),
                        child: Text(
                          'Posts',
                          style: TextStyle(
                              color: selectedTab.value == 'Posts'
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff717171),
                              fontSize: 12.px,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'medium'),
                        ),
                      ),
                    ),
                    getHorizontalSpace(1.h),
                    GestureDetector(
                        onTap: () {
                          selectedTab.value = 'Listings';
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.5.h, vertical: 1.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.h),
                                bottomRight: Radius.circular(10.h),
                              ),
                              color: selectedTab.value == 'Listings'
                                  ? MyColor.blackBoldColor
                                  : const Color(0xffE2E2E2)),
                          child: Text(
                            'Listings',
                            style: TextStyle(
                                color: selectedTab.value == 'Listings'
                                    ? const Color(0xffFFFFFF)
                                    : const Color(0xff717171),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'medium'),
                          ),
                        )),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                Column(
                  children: [
                    selectedTab.value == 'Posts'
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              getVerticalSpace(2.h),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.2.h, vertical: 1.h),
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.h),
                                      color: MyColor.buttonColor),
                                  child: TextFormField(
                                    controller:thoughtsController ,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                          borderSide: BorderSide.none,
                                        ),
                                        isCollapsed: true,
                                        hintText: 'Share your thoughts...',
                                        hintStyle: Constant.textLoginHint
                                            .copyWith(
                                                color: const Color(0xff828282),
                                                fontSize: 12.px,
                                                fontWeight: FontWeight.w400)),
                                  )),
                              getVerticalSpace(2.h),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 8.h,
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: imagesList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(0.8.h), // 10% of the height (8.h)
                                            child: GestureDetector(
                                              onTap: () {
                                                if (index == 2) {
                                                  Get.to(() => GoToLive1());
                                                }
                                                if (index == 0) {
                                                  imagePickerController.getImage().then((_) {
                                                    // Trigger a UI update
                                                    isImageSelected.value = true;
                                                    imagePickerController.update();
                                                  });
                                                }
                                              },
                                              child: DottedBorder(
                                                dashPattern: const [10, 10],
                                                color: MyColor.blackBoldColor,
                                                strokeWidth: 3,
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(1.8.h), // 10% of the height (8.h)
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 2.2.h, vertical: 1.h),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                        child: Obx(() {
                                                          if (index == 0 && imagePickerController.imagePath.isNotEmpty) {
                                                            return Image.file(
                                                              File(imagePickerController.imagePath.toString()),
                                                              fit: BoxFit.cover,
                                                            );
                                                          } else {
                                                            return SvgPicture.asset(imagesList[index]);
                                                          }
                                                        }),
                                                      ),
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
                                  Obx(() {
                                    if (isImageSelected.value && imagePickerController.imagePath.isNotEmpty) {
                                      return Container(
                                        height: 20.h, // Adjust height as needed
                                        width: double.infinity,
                                        margin: EdgeInsets.only(top: 2.h),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: MyColor.blackBoldColor, width: 2),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Image.file(
                                          File(imagePickerController.imagePath.toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return SizedBox.shrink(); // Hide the container if no image is selected
                                    }
                                  }),
                                ],
                              ),
                              getVerticalSpace(2.h),
                              customTextField('Location', locationController),
                              getVerticalSpace(2.h),
                              customTextField(
                                  'Tag Someone', tagSomeoneController),
                              getVerticalSpace(2.h),
                              customTextField(
                                  'Add Tags(Optional)', addTagController),
                              getVerticalSpace(4.6.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.5.h, vertical: 1.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                          border: Border.all(
                                              color: MyColor.blackBoldColor)),
                                      child: Text(
                                        'Cancel',
                                        style: Constant.buttonText.copyWith(
                                            color: MyColor.blackBoldColor),
                                      ),
                                    ),
                                  ),
                                  getHorizontalSpace(1.h),
                                  authController.isLoading.value
                                      ? const Center(child: CircularProgressIndicator(color: MyColor.blackBold))
                                      : GestureDetector(
                                    onTap: () {
                                      authController.createPost(
                                        thoughts: thoughtsController.text,
                                        media: imagePickerController.imagePath.isNotEmpty
                                            ? imagePickerController.imagePath.toString()
                                            : "", // Add the actual media data
                                        location: locationController.text,
                                        taggedUsers: tagSomeoneController.text.isNotEmpty
                                            ? tagSomeoneController.text.split(',')
                                            : [], // Convert comma-separated string to list
                                        tags: addTagController.text.isNotEmpty
                                            ? addTagController.text.split(',')
                                            : [], // Convert comma-separated string to list
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 1.1.h),
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
                              getVerticalSpace(4.5.h),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              getVerticalSpace(2.h),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.2.h, vertical: 1.h),
                                  alignment: Alignment.topCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.h),
                                      color: MyColor.buttonColor),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                          borderSide: BorderSide.none,
                                        ),
                                        isCollapsed: true,
                                        hintText: 'Share your thoughts...',
                                        hintStyle: Constant.textLoginHint
                                            .copyWith(
                                                color: const Color(0xff828282),
                                                fontSize: 12.px,
                                                fontWeight: FontWeight.w400)),
                                  )),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 8.h,
                                child: ListView.builder(
                                  itemCount: imagesList.length - 1,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.2.h),
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
                                                horizontal: 1.8.h,
                                                vertical: 1.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    imagesList[index]),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.h, vertical: 2.h),
                                decoration: BoxDecoration(
                                    color: MyColor.buttonColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(2.h)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Choose Category(Optional)',
                                          style: Constant.buttonText
                                              .copyWith(fontSize: 14.px),
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: categoryList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.4.h),
                                          child: Obx(
                                            () => GestureDetector(
                                              onTap: () {
                                                selectedCategory.value = index;
                                              },
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        categoryList[index],
                                                        style: Constant
                                                            .buttonText
                                                            .copyWith(
                                                                fontSize:
                                                                    12.px),
                                                      ),
                                                      selectedCategory.value ==
                                                              index
                                                          ? SvgPicture.asset(
                                                              'assets/svg/tick.svg')
                                                          : Container(
                                                              height: 2.h,
                                                              width: 2.h,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
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
                              getVerticalSpace(4.h),
                              customTextField('Location', locationController),
                              getVerticalSpace(2.h),
                              customTextField('Tag Someone', tagSomeoneController),
                              getVerticalSpace(2.h),
                              customTextField(
                                  'Add Tags(Optional)', addTagController),
                              getVerticalSpace(3.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6.7.h, vertical: 1.1.h),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                          border: Border.all(
                                              color: MyColor.blackBoldColor)),
                                      child: Text(
                                        'Cancel',
                                        style: Constant.buttonText.copyWith(
                                            color: MyColor.blackBoldColor),
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
                                          borderRadius:
                                              BorderRadius.circular(10.h),
                                          border: Border.all(
                                              color: MyColor.blackBoldColor)),
                                      child: Text(
                                        'Done',
                                        style: Constant.buttonText
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              getVerticalSpace(4.5.h),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
