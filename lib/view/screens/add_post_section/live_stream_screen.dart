import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/view/screens/add_post_section/live_watchings_screen.dart';

import 'live_stream1.dart';

class GoToLive extends StatefulWidget {
  const GoToLive({super.key, required this.title});
  final String title;

  @override
  State<GoToLive> createState() => _GoToLiveState();
}

class _GoToLiveState extends State<GoToLive> {
  final controller = StoryController();
  final TextEditingController addCommentController = TextEditingController();
  final RxList<String> commentList = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/png/liveimage.png'),
              fit: BoxFit.cover,
            )),
        Positioned(
          top: 10.h,
          left: 2.h,
          right: 2.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: .7.h, vertical: .45.h),
                    decoration: BoxDecoration(
                      color: const Color(0xffFF2060),
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: .3.h,
                          backgroundColor: Colors.white,
                        ),
                        getHorizontalSpace(1.h),
                        Text(
                          'Live',
                          style: Constant.textGreySign
                              .copyWith(color: const Color(0xffFFFFFF)),
                        )
                      ],
                    ),
                  ),
                  getHorizontalSpace(1.5.h),
                  Text(
                    '00:25',
                    style: Constant.textGreySign.copyWith(
                        fontSize: 12.px, color: const Color(0xffFFFFFF)),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LiveWatchingsScreen());
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/png/watch.svg'),
                    getHorizontalSpace(.6.h),
                    Text(
                      '2.3K Watching',
                      style: Constant.textGreySign.copyWith(
                          fontSize: 12.px, color: const Color(0xffFFFFFF)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            top: 14.h,
            left: 2.h,
            right: 2.h,
            child: Text(
              widget.title.isEmpty ? 'Property Prices in Taxes' : widget.title,
              style: TextStyle(
                  fontFamily: 'medium',
                  color: Colors.white,
                  fontSize: 16.px,
                  fontWeight: FontWeight.w500),
            )),
        Positioned(
          top: 4.h,
          left: 2.h,
          right: 2.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 2.3.h,
                backgroundImage: const AssetImage('assets/png/profile.png'),
              ),
              getHorizontalSpace(2.h),
              Text(
                'Kevin.J',
                style: Constant.headingText
                    .copyWith(color: const Color(0xffFFFFFF), fontSize: 14.px),
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: .8.h, vertical: .8.h),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF).withOpacity(0.44),
                        borderRadius: BorderRadius.circular(1.h)),
                    child: SvgPicture.asset('assets/svg/rotate.svg'),
                  ),
                  getHorizontalSpace(1.9.h),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: .4.h, vertical: .4.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF).withOpacity(0.44),
                          borderRadius: BorderRadius.circular(1.h)),
                      child: SvgPicture.asset('assets/svg/cros.svg'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 3.9.h,
          left: 2.h,
          right: 2.h,
          child: customTextField('Add a comment...', addCommentController,
              containerColor: const Color(0xffFFFFFF).withOpacity(0.2),
              hintColor: const Color(0xffFFFFFF),
              textColor: Colors.white,
              borderColor: const Color(0xffFFFFFF),
              suffixIcon: GestureDetector(
                onTap: () {
                  commentList.add(addCommentController.text);
                },
                child: Container(
                  margin: EdgeInsets.all(.8.h),
                  padding: EdgeInsets.all(.4.h),
                  height: 2.h,
                  width: 2.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffFFFFFF).withOpacity(0.2),
                      border: Border.all(
                          color: const Color(0xffFFFFFF), width: .2.h)),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
        Positioned(
          bottom: 40.h,
          left: 2.h,
          right: 20.h,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: commentList.length,
            itemBuilder: (context, index) {
              // Function to limit the length of subtitle text
              String getLimitedSubtitle(String text) {
                const maxLength = 50; // Set your desired maximum length here
                return text.length > maxLength
                    ? '${text.substring(0, maxLength)}...'
                    : text;
              }

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 1.h),
                margin: EdgeInsets.symmetric(vertical: 1.h),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.h)),
                // Background color
                child: ListTile(
                  contentPadding:
                      EdgeInsets.zero, // Remove default padding around ListTile
                  horizontalTitleGap: 0.8
                      .h, // Adjust horizontal gap between title and leading widget
                  minVerticalPadding: 0, // Ensure no minimum vertical padding
                  enabled: true, // Ensure ListTile is enabled

                  leading: CircleAvatar(
                    radius: 2.4.h,
                    backgroundImage: const AssetImage('assets/png/profile.png'),
                  ),
                  title: Text(
                    'Kevin.J',
                    style: Constant.headingText.copyWith(
                      color: const Color(0xffFFFFFF),
                      fontSize: 12.px,
                    ),
                  ),
                  subtitle: Text(
                    getLimitedSubtitle(commentList[index]),
                    style: Constant.headingText.copyWith(
                      color: const Color(0xffFFFFFF),
                      fontSize: 10.px,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          color: Colors.transparent, // Transparent background for Material
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.4.h, vertical: 2.8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.5.h),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Center(
                  child: Text(
                    'Are you sure you want to end live session?',
                    textAlign: TextAlign.center,
                    style: Constant.buttonText.copyWith(
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 20.px),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.h, vertical: 1.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.h),
                          border: Border.all(color: const Color(0xffFFFFFF)),
                        ),
                        child: Text(
                          'Cancel',
                          style:
                              Constant.buttonText.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    getHorizontalSpace(1
                        .h), // Replaced custom method with SizedBox for simplicity
                    GestureDetector(
                      onTap: () {
                        Get.to(() => GoToLive1());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.h, vertical: 1.1.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffF20707),
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                        child: Text(
                          'End',
                          style:
                              Constant.buttonText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
