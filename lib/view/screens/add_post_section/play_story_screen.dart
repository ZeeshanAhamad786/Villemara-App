import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 3.h,
                  ),
                  getHorizontalSpace(2.h),
                   Text('Kevin.J',style: Constant.headingText.copyWith(color: const Color(0xffFFFFFF)),),
                ],
              ),
              getHorizontalSpace(20.4.h),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/delete.svg'),
                  getHorizontalSpace(3.h),
                  SvgPicture.asset('assets/svg/cros.svg'),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 3.9.h,
          left: 2.5.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(width: 35.2.h,
                      child: Text("@Sam Smith Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae",style: Constant.headingText.copyWith(color: const Color(0xffFFFFFF)),textAlign: TextAlign.start,)),
                ],
              ),
              getHorizontalSpace(3.9.h),
              Column(
                children: [
                 Container(padding: EdgeInsets.symmetric(horizontal: 1.4.h,vertical:1.4.h ),
                   decoration: BoxDecoration(
                   color: const Color(0xffFFFFFF).withOpacity(0.44),
                     borderRadius: BorderRadius.circular(1.h)
                 ),child: SvgPicture.asset('assets/svg/like.svg'),),
                  getVerticalSpace(1.2.h),
                  Container(padding: EdgeInsets.symmetric(horizontal: 1.2.h,vertical:1.2.h ),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF).withOpacity(0.44),
                        borderRadius: BorderRadius.circular(1.h)
                    ),child: SvgPicture.asset('assets/svg/share.svg'),),
                  getVerticalSpace(1.2.h),

                  Container(height: 5.h,width: 5.h,
                    padding: EdgeInsets.symmetric(horizontal: 1.2.h,vertical:1.2.h ),
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF).withOpacity(0.44),
                        borderRadius: BorderRadius.circular(1.h)
                    ),child:Image.asset('assets/png/eye.png',fit: BoxFit.cover,),),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
