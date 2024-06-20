import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/constant.dart';
import 'package:villemara_app/controller/custom_widgets/custom_text_form_feld.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

import 'blogs_details.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> blogs=[
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
      "Every Realtor Should Read in 2024",
    ];
    List<String> images=[
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
      "assets/png/blogs.png",
    ];
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getVerticalSpace(6.h),
              Text(
                'Blogs/News',
                style: Constant.headingText,
              ),
              getVerticalSpace(2.5.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.h),
                child: CustomTextFormField(
                  hintText: 'Search...',
                  prefixIcon: SvgPicture.asset('assets/svg/searchcon.svg'),
                  borderRadius: 5.h,
                ),
              ),
              getVerticalSpace(2.h),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: blogs.length,
                    itemBuilder: (context,index){return
                      GestureDetector(onTap: (){
                        Get.to(()=> BlogsDetailScreen(
                          title:blogs[index] ,
                          imagePath:images[index] ,
                        ));
                      },
                        child: Container(padding: EdgeInsets.symmetric(
                            horizontal: .8.h,
                            vertical: .8.h
                        ),
                          margin: EdgeInsets.symmetric(vertical: 1.h),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              boxShadow: [
                                BoxShadow(color: const Color(0xff000000).withOpacity(0.1),
                                    offset: const Offset(1, 1),
                                    spreadRadius: 0,
                                    blurRadius: 7.8.px),


                              ],
                              borderRadius: BorderRadius.circular(1.4.h)
                          ),
                          child: Row(
                            children: [
                             Container(
                               height:7.9.h ,
                               width: 9.6.h,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(1.6.h)
                                     ,image:  DecorationImage(image:AssetImage(images[index]) )
                               ),
                             ),
                              getHorizontalSpace(1.h),
                              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Jan 4, 2022',style: TextStyle(fontFamily: 'medium',color: const Color(0xff828282),fontSize: 12.px,fontWeight: FontWeight.w400),),

                                  Text(blogs[index],style: TextStyle(fontFamily: 'medium',color: const Color(0xff444444),fontSize: 16.px,fontWeight: FontWeight.w400),),
                                ],
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
