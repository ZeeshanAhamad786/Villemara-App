import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> data = [
    "assets/png/profile.png",
    "assets/png/profile2.png",
    "assets/png/profile3.png",
  ];
  List<String> data1 = [
    "Han liked your post",
    "Tate tagged you in post",
    "Han commented on your post",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
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
            Text("Notifications",
                style: Constant.textLikes.copyWith(
                    fontSize: 14.px,
                    color: const Color(0xff000E08),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'bold')),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today',style: TextStyle(fontFamily:'medium' ,fontWeight:  FontWeight.w400 ,fontSize: 12.px,color: const Color(0xff717171)),),
            getVerticalSpace(1.h),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: .8.h, vertical: .8.h),
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff000000).withOpacity(0.1),
                                offset: const Offset(1, 1),
                                spreadRadius: 0,
                                blurRadius: 7.8.px),
                          ],
                          borderRadius: BorderRadius.circular(1.4.h)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(data[index]),
                            radius: 20,
                          ),
                          getHorizontalSpace(2.w),
                          Text(
                            data1[index],
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: const Color(0xff9D9D9D),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400),
                          ),

                          const Expanded(child: SizedBox()),
                          Text(
                           '1h ago',
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: const Color(0xff9D9D9D),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            getVerticalSpace(1.9.h),
            Text('yesterday',style: TextStyle(fontFamily:'medium' ,fontWeight:  FontWeight.w400 ,fontSize: 12.px,color: const Color(0xff717171)),),
            getVerticalSpace(1.h),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: .8.h, vertical: .8.h),
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff000000).withOpacity(0.1),
                                offset: const Offset(1, 1),
                                spreadRadius: 0,
                                blurRadius: 7.8.px),
                          ],
                          borderRadius: BorderRadius.circular(1.4.h)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(data[index]),
                            radius: 20,
                          ),
                          getHorizontalSpace(2.w),
                          Text(
                            data1[index],
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: const Color(0xff9D9D9D),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '1h ago',
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: const Color(0xff9D9D9D),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            getVerticalSpace(1.9.h),
            Text('29/05/2024',style: TextStyle(fontFamily:'medium' ,fontWeight:  FontWeight.w400 ,fontSize: 12.px,color: const Color(0xff717171)),),
            getVerticalSpace(1.h),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: .8.h, vertical: .8.h),
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                color: const Color(0xff000000).withOpacity(0.1),
                                offset: const Offset(1, 1),
                                spreadRadius: 0,
                                blurRadius: 7.8.px),
                          ],
                          borderRadius: BorderRadius.circular(1.4.h)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(data[index]),
                            radius: 20,
                          ),
                          getHorizontalSpace(2.w),
                          Text(
                            data1[index],
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: const Color(0xff9D9D9D),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '1h ago',
                            style: TextStyle(
                                fontFamily: 'medium',
                                color: const Color(0xff9D9D9D),
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            getVerticalSpace(1.9.h),
          ],
        ),
      ),
    );
  }
}
