import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/view/screens/add_post_section/live_stream_screen.dart';
import 'package:villemara_app/view/screens/add_post_section/live_watchings_screen.dart';

class GoToLive1 extends StatelessWidget {
  GoToLive1({super.key});
  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
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
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 2.3.h,
                    color: Colors.white,
                  )),
              const Expanded(child: SizedBox()),
              Text(
                'Go Live',
                style: Constant.textGreySign
                    .copyWith(fontSize: 12.px, color: const Color(0xffFFFFFF)),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
        Positioned(
          bottom: 3.9.h,
          left: 2.5.h,
          right: 2.5.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customTextField('Title', titleController),
              getVerticalSpace(3.h),
              GestureDetector(onTap: (){
                Get.to(()=> GoToLive( title: titleController.text,));
              },
                child: Container(alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 1.4.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      color: const Color(0xff1E1E1E)),
                  child: Text(
                    'Go Live',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.px,
                        color: const Color(0xffFFFFFF)),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
