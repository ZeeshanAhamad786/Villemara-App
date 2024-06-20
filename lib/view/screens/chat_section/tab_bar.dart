import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

import 'chat_room.dart';

class ChatTabBar extends StatelessWidget {
  const ChatTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      "assets/png/profile.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
      "assets/png/profile.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
    ];

    List<String> data1 = [
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
    ];
    List<String> membersImages = [
      "assets/png/profile.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
      "assets/png/profile.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
      "assets/png/profile.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
      "assets/png/profile.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
      "assets/png/profile2.png",
      "assets/png/profile3.png",
    ];
    List<String> members = [
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
      "John Wick",
      "Lisa Copper",
    ];
    final RxString selectedTab = 'Chat'.obs;
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: Column(
            children: [
              getVerticalSpace(7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      selectedTab.value = 'Chat';
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.h, vertical: 1.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.h),
                            bottomLeft: Radius.circular(10.h),
                          ),
                          color: selectedTab.value == 'Chat'
                              ? MyColor.blackBoldColor
                              : const Color(0xffE2E2E2)),
                      child: Text(
                        'Chats',
                        style: TextStyle(
                            color: selectedTab.value == 'Chat'
                                ? const Color(0xffFFFFFF)
                                : const Color(0xff717171),
                            fontSize: 12.px,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'medium'),
                      ),
                    ),
                  ),
                  getHorizontalSpace(1.h),
                  GestureDetector(
                      onTap: () {
                        selectedTab.value = 'All Members';
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.5.h, vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.h),
                              bottomRight: Radius.circular(10.h),
                            ),
                            color: selectedTab.value == 'All Members'
                                ? MyColor.blackBoldColor
                                : const Color(0xffE2E2E2)),
                        child: Text(
                          'All Members',
                          style: TextStyle(
                              color: selectedTab.value == 'All Members'
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff717171),
                              fontSize: 12.px,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'medium'),
                        ),
                      )),
                  const Expanded(child: SizedBox()),
                ],
              ),
              //  getVerticalSpace(24.7.h),
              //  SvgPicture.asset('assets/svg/chatsicon.svg'),
              //  getVerticalSpace(4.1.h),
              //  Text('No Conversations',style: TextStyle(fontFamily: 'medium',fontWeight: FontWeight.w400,fontSize: 20.px,color: const Color(0xff5F5F5F)),)
              // , getVerticalSpace(1.7.h),
              //  Text('Your conversations will show up here.',style: TextStyle(fontFamily: 'medium',fontWeight: FontWeight.w400,fontSize: 13.px,color: const Color(0xff717171)),)
              //
              getVerticalSpace(1.h),
              selectedTab.value == 'Chat'
                  ? Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                         
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(onTap: () {

                              Get.to(()=> ChatRoomScreen(
                                title:data1[index] ,
                                imagePath:data[index] ,
                              ));
                            },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: .8.h, vertical: .8.h),
                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xff000000)
                                              .withOpacity(0.1),
                                          offset: const Offset(1, 1),
                                          spreadRadius: 0,
                                          blurRadius: 7.8.px),
                                    ],
                                    borderRadius: BorderRadius.circular(1.4.h)),
                                child: Row(
                                  children: [
                                    Stack(children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(data[index]),
                                        radius: 3.h,
                                      ),
                                      index == 2 || index == 4 || index == 0
                                          ? const SizedBox.shrink()
                                          : Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: CircleAvatar(
                                                radius: .8.h,
                                                backgroundColor:
                                                    const Color(0xff2CC069),
                                              ))
                                    ]),
                                    getHorizontalSpace(2.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data1[index],
                                          style: TextStyle(
                                              fontFamily: 'medium',
                                              color: const Color(0xff9D9D9D),
                                              fontSize: 12.px,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet',
                                          style: TextStyle(
                                              fontFamily: 'medium',
                                              color: const Color(0xff717171),
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 2.7.h,
                                      width: 2.7.h,
                                      decoration: const BoxDecoration(
                                          color: MyColor.blackBoldColor,
                                          shape: BoxShape.circle),
                                      child: Text(
                                        '12',
                                        style: TextStyle(
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'medium',
                                            color: const Color(0xffFFFFFF)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  : Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.zero,

                          itemCount: members.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: .8.h, vertical: .8.h),
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xff000000)
                                            .withOpacity(0.1),
                                        offset: const Offset(1, 1),
                                        spreadRadius: 0,
                                        blurRadius: 7.8.px),
                                  ],
                                  borderRadius: BorderRadius.circular(1.4.h)),
                              child: Row(
                                children: [
                                  Stack(children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(membersImages[index]),
                                      radius: 3.h,
                                    ),
                                    index == 2 || index == 4 || index == 0
                                        ? const SizedBox.shrink()
                                        : Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: CircleAvatar(
                                              radius: .8.h,
                                              backgroundColor:
                                                  const Color(0xff2CC069),
                                            ))
                                  ]),
                                  getHorizontalSpace(2.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        members[index],
                                        style: TextStyle(
                                            fontFamily: 'medium',
                                            color: const Color(0xff9D9D9D),
                                            fontSize: 12.px,
                                            fontWeight: FontWeight.w400),
                                      ),

                                    ],
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Container(padding: EdgeInsets.all(.5.h),

                                    height: 3.h,
                                    width: 3.h,
                                    decoration: const BoxDecoration(
                                        color: MyColor.blackBoldColor,
                                        shape: BoxShape.circle),
                                    child:SvgPicture.asset('assets/svg/email.svg')
                                  ),getHorizontalSpace(.8.h),
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(()=> ChatRoomScreen(
                                        title:data1[index] ,
                                        imagePath:data[index] ,
                                      ));
                                    },
                                    child: Container(padding: EdgeInsets.all(.5.h),

                                        height: 3.h,
                                        width: 3.h,
                                        decoration: const BoxDecoration(
                                            color: MyColor.blackBoldColor,
                                            shape: BoxShape.circle),
                                        child:SvgPicture.asset('assets/svg/message1.svg')
                                    ),
                                  ),getHorizontalSpace(.8.h),
                                  Container(padding: EdgeInsets.all(.5.h),

                                      height: 3.h,
                                      width: 3.h,
                                      decoration: const BoxDecoration(
                                          color: MyColor.blackBoldColor,
                                          shape: BoxShape.circle),
                                      child:SvgPicture.asset('assets/svg/videocall.svg')
                                  ),getHorizontalSpace(.8.h),
                                  Container(padding: EdgeInsets.all(.5.h),

                                      height: 3.h,
                                      width: 3.h,
                                      decoration: const BoxDecoration(
                                          color: MyColor.blackBoldColor,
                                          shape: BoxShape.circle),
                                      child:SvgPicture.asset('assets/svg/message.svg')
                                  ),getHorizontalSpace(.6.h),
                                ],
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
