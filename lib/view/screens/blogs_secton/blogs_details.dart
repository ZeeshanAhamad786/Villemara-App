import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
class BlogsDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  const BlogsDetailScreen(
      {super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.3.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerticalSpace(6.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(width: 20.h,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Constant.headingText,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                getVerticalSpace(.5.h),
                Container(
                  height: 25.4.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: const DecorationImage(
                        image: AssetImage('assets/png/blogs.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(1.6.h),
                  ),
                ),
                getVerticalSpace(1.5.h),
                Text(
                  'Jan 4, 2022',
                  style: TextStyle(
                      fontFamily: 'medium',
                      color: const Color(0xff828282),
                      fontSize: 12.px,
                      fontWeight: FontWeight.w400),
                ),
                getVerticalSpace(1.2.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Constant.headingText,
                ),
                getVerticalSpace(1.2.h),
                Row(
                  children: [
                    Container(
                      height: 3.4.h,
                      width: 3.4.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: const DecorationImage(
                            image: AssetImage('assets/png/profile5.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(.5.h),
                      ),
                    ),
                    getHorizontalSpace(.8.h),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: 'By: ', style: Constant.headingText),
                      TextSpan(
                        text: 'Villemara',
                        style: Constant.headingText.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ])),
                  ],
                ),
                getVerticalSpace(1.5.h),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequent porta eu ultrices fugitive. Et, faucibus ut amet turps. Facilitates faucibus sempre crash purus.",
                  style: TextStyle(
                      fontFamily: 'regular',
                      color: const Color(0xff636363),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.px),
                ),
                Text(
                  "\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequent porta eu ultrices fugitive. Et, faucibus ut amet turps. Facilitates faucibus sempre crash purus.",
                  style: TextStyle(
                      fontFamily: 'regular',
                      color: const Color(0xff636363),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.px),
                ),
                Text(
                  "\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequent porta eu ultrices fugitive. Et, faucibus ut amet turps. Facilitates faucibus sempre crash purus.",
                  style: TextStyle(
                      fontFamily: 'regular',
                      color: const Color(0xff636363),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.px),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequent porta eu ultrices fugitive. Et, faucibus ut amet turps. Facilitates faucibus sempre crash purus.",
                  style: TextStyle(
                      fontFamily: 'regular',
                      color: const Color(0xff636363),
                      fontWeight: FontWeight.w400,
                      fontSize: 12.px),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
