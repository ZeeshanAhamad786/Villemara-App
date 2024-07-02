import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/home_section/notification_screen.dart';
import 'package:villemara_app/view/screens/home_section/search_filter_screen.dart';
import 'package:villemara_app/view/screens/home_section/story_screen.dart';
import 'package:villemara_app/view/screens/posts/post_screen.dart';
import '../../../controller/custom_widgets/constant.dart';
import '../add_post_section/add_story_screen.dart';
import '../posts/listings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/png/profile.png",
    "assets/png/profile2.png",
    "assets/png/profile3.png",
    "assets/png/profile4.png",
    "assets/png/profile5.png",
  ];

  List<String> profileNames = [
    "zeeshan",
    "Ahmad",
    "Amer",
    "Abdullah",
    "Ramzan",
  ];

  RxBool isSelected = false.obs;
  RxInt selectedIndex = 0.obs; // Add this to manage tab selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getVerticalSpace(8.h),
                  Obx(() => isSelected.value
                      ? TextFormField(
                          cursorColor: MyColor.blackBoldColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            prefixIcon: Transform.scale(
                              scale: 0.5,
                              child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => const SearchFilterScreen());
                                  },
                                  child: SvgPicture.asset(
                                      "assets/svg/filter.svg")),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(6.px),
                              child: GestureDetector(onTap: (){
                                isSelected.value=false;
                              },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: MyColor.blackBoldColor
                                                .withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: const Offset(1, 1),
                                            spreadRadius: 0)
                                      ]),
                                  child: Transform.scale(
                                      scale: 0.5,
                                      child: SvgPicture.asset(
                                          "assets/svg/cancel.svg")),
                                ),
                              ),
                            ),
                            hintText: "Search",
                            hintStyle: Constant.textSearch,
                            contentPadding: const EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: MyColor.blackBoldColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  const BorderSide(color: MyColor.SearchColor),
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            SvgPicture.asset("assets/svg/villemeraLogo.svg"),
                            const Expanded(child: SizedBox()),
                            GestureDetector(
                              onTap: () {
                                isSelected.value = true;
                              },
                              child: Container(
                                height: 40.px,
                                width: 40.px,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: MyColor.blackBoldColor
                                              .withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(1, 1),
                                          spreadRadius: 0)
                                    ]),
                                child: Transform.scale(
                                    scale: 0.5,
                                    child: SvgPicture.asset(
                                        "assets/svg/search1svg.svg")),
                              ),
                            ),
                            getHorizontalSpace(2.w),
                            Container(
                              height: 40.px,
                              width: 40.px,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: MyColor.blackBoldColor
                                            .withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(1, 1),
                                        spreadRadius: 0)
                                  ]),
                              child: Transform.scale(
                                  scale: 0.5,
                                  child: GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => const NotificationScreen());
                                      },
                                      child: SvgPicture.asset(
                                          "assets/svg/notification.svg"))),
                            )
                          ],
                        )),
                  getVerticalSpace(3.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              Get.to(() => AddStoryScreen());
                            } else {
                              Get.to(() => StoryScreen());
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage(images[index]),
                                          radius: 30,
                                        ),
                                        if (index == 0)
                                          Positioned(
                                            bottom: 0,
                                            right: .2,
                                            child: Container(alignment: Alignment.center,
                                              height: 2.h,
                                              width: 2.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: MyColor.blackBoldColor,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 10.px,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    getHorizontalSpace(.5.h),
                                  ],
                                ),
                                getVerticalSpace(0.5.h),
                                Text(
                                  profileNames[index],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  getVerticalSpace(2.h),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectedIndex.value = 0;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedIndex.value == 0
                                          ? Colors.black
                                          : MyColor.textDarkGrey,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.px, horizontal: 10.w),
                                    child: Center(
                                      child: Text(
                                        'Posts',
                                        style: TextStyle(
                                            color: selectedIndex.value == 0
                                                ? Colors.white
                                                : MyColor.choosePerson),
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
                                      color: selectedIndex.value == 1
                                          ? Colors.black
                                          : MyColor.textDarkGrey,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.px, horizontal: 8.w),
                                    child: Center(
                                      child: Text(
                                        'Listings',
                                        style: TextStyle(
                                            color: selectedIndex.value == 1
                                                ? Colors.white
                                                : MyColor.choosePerson),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Obx(() {
                            return selectedIndex.value == 0
                                ? const PostScreen()
                                : const ListingsScreen();
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
