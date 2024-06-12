import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

class StoryScreen extends StatelessWidget {
  StoryScreen({super.key});
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyItems = [
      StoryItem.text(title: 'First Story', backgroundColor: Colors.blue),
      StoryItem.text(title: 'Second Story', backgroundColor: Colors.blue),
      StoryItem.text(title: 'Third Story', backgroundColor: Colors.blue),
      StoryItem.text(title: 'Fourth Story', backgroundColor: Colors.blue),
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
          child: SizedBox(
           width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:  AssetImage("assets/png/profile.png"),
                  radius: 3.h,
                ),
                getHorizontalSpace(2.h),
                Text('Kevin.J',style: Constant.headingText.copyWith(color: const Color(0xffFFFFFF)),),
                // getHorizontalSpace(20.4.h),
                Spacer(),
                GestureDetector(onTap: () {
                  Get.back();
                },
                    child: SvgPicture.asset('assets/svg/cros.svg'))
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 5.h,left: 2.5.h,right: 3.w,
          child: Row(children: [
            Expanded(child: Text("@Sam Smith Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae",
              style:Constant.textSaim ,)),
            Container(padding: EdgeInsets.symmetric(horizontal: 1.4.h,vertical:1.4.h ),
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF).withOpacity(0.44),
                  borderRadius: BorderRadius.circular(1.h)
              ),child: SvgPicture.asset('assets/svg/like.svg'),),
            getHorizontalSpace(2.w),
            Container(padding: EdgeInsets.symmetric(horizontal: 1.2.h,vertical:1.2.h ),
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF).withOpacity(0.44),
                  borderRadius: BorderRadius.circular(1.h)
              ),child: SvgPicture.asset('assets/svg/share.svg'),),
          ],),
        )
      ]),
    );
  }
}
