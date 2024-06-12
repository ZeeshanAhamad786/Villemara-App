import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/view/screens/add_post_section/live_watchings_screen.dart';

class GoToLive extends StatelessWidget {
  GoToLive({super.key});
  final controller = StoryController();

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
          top: 6.h,
          left: 2.h,
          right: 2.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 2.3.h,
                        color: Colors.white,
                      )),
                  getHorizontalSpace(2.5.h),
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
          bottom: 3.9.h,
          left: 2.5.h,
          right: 2.5.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              const Spacer(),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.4.h, vertical: 1.4.h),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF).withOpacity(0.44),
                    borderRadius: BorderRadius.circular(1.h)),
                child: SvgPicture.asset('assets/svg/like.svg'),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
