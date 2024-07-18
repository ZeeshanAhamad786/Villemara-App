import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:villemara_app/view/screens/add_post_section/views_of_story.dart';
import 'package:villemara_app/view/screens/home_section/share_screen.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';

class PlayStoryScreen extends StatelessWidget {
  PlayStoryScreen({super.key});
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyItems = [
      StoryItem.text(title: 'First Story', backgroundColor: Colors.green),
      StoryItem.text(title: 'Second Story', backgroundColor: Colors.green),
      StoryItem.text(title: 'Third Story', backgroundColor: Colors.green),
      StoryItem.text(title: 'Fourth Story', backgroundColor: Colors.green),
    ]; // your list of stories

    return Scaffold(
      body: Stack(children: [
        StoryView(
          storyItems: storyItems,
          controller: controller, // pass controller here too
          repeat: true, // should the stories be slid forever
          onComplete: () {},
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.down) {
              Navigator.pop(context);
            }
          },
        ),
        Positioned(
          top: 7.5.h,
          left: 2.h,
          right: 2.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 2.5.h,
                    backgroundImage: const AssetImage('assets/png/profile.png'),
                  ),
                  getHorizontalSpace(2.h),
                  Text(
                    'Kevin.J',
                    style: Constant.headingText
                        .copyWith(color: const Color(0xffFFFFFF)),
                  ),
                  getHorizontalSpace(1.h),
                  Text(
                    '18h',
                    style: Constant.headingText
                        .copyWith(color: const Color(0xffFFFFFF)),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: SvgPicture.asset('assets/svg/delete.svg')),
                  getHorizontalSpace(3.h),
                  GestureDetector(onTap: (){
                    Get.back();
                  },
                      child: SvgPicture.asset('assets/svg/cros.svg')),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 3.9.h,
          left: 2.5.h,
          right: 2.5.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                      width: 35.2.h,
                      child: Text(
                        "@Sam Smith Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae",
                        style: Constant.headingText
                            .copyWith(color: const Color(0xffFFFFFF)),
                        textAlign: TextAlign.start,
                      )),
                ],
              ),

              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 1.4.h, vertical: 1.4.h),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF).withOpacity(0.44),
                        borderRadius: BorderRadius.circular(1.h)),
                    child: SvgPicture.asset('assets/svg/like.svg'),
                  ),
                  getVerticalSpace(1.2.h),
                  GestureDetector(onTap: (){
                    Get.to(()=>const ShareScreen());
                  },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.2.h, vertical: 1.2.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF).withOpacity(0.44),
                          borderRadius: BorderRadius.circular(1.h)),
                      child: SvgPicture.asset('assets/svg/share.svg'),
                    ),
                  ),
                  getVerticalSpace(1.2.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewsStoryScreen());
                    },
                    child: Container(
                      height: 5.h,
                      width: 5.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.2.h, vertical: 1.2.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF).withOpacity(0.44),
                          borderRadius: BorderRadius.circular(1.h)),
                      child: Image.asset(
                        'assets/png/eye.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              height: 26.h,
              width: 43.2.h,
              padding: EdgeInsets.symmetric(horizontal: 4.4.h, vertical: 2.8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.5.h),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 5.2.h,
                          width: 5.2.h,
                          child: SvgPicture.asset(
                            'assets/svg/deletealert.svg',
                            fit: BoxFit.cover,
                          )),
                      getHorizontalSpace(2.h),
                      Text(
                        'Delete Story',
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: 16.px,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                 getVerticalSpace(2.5.h),
                  Text(
                    'Are you sure you want to Delete this Post?',
                    style: Constant.buttonText
                        .copyWith(color: const Color(0xff222222),
                    fontWeight: FontWeight.w600),
                  ),
                  getVerticalSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            border: Border.all(color: const Color(0xffA0A0A0)),
                          ),
                          child: Text(
                            'No',
                            style: Constant.buttonText
                                .copyWith(color:  const Color(0xffA0A0A0)),
                          ),
                        ),
                      ),
                     getHorizontalSpace(1.h),// Replaced custom method with SizedBox for simplicity
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.h, vertical: 1.1.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffF20707),
                            borderRadius: BorderRadius.circular(1.2.h),
                          ),
                          child: Text(
                            'Yes',
                            style: Constant.buttonText
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
