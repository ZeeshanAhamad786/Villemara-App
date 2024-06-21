import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key, this.title, this.imagePath});
  final String? title;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    RxList<String> chatList = <String>[].obs;
    RxInt selectedIndex = 0.obs;

    RxString messageLength = ''.obs;
    final TextEditingController chatController = TextEditingController();
    return Scaffold(
      body:  Column(
        children: [
          getVerticalSpace(6.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.5.h),
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
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 2.5.h,
                        ),
                      ),
                      getHorizontalSpace(2.h),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 2.4.h,
                          backgroundImage: AssetImage(imagePath!),
                        ),
                      ),
                      getHorizontalSpace(1.5.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title!.toString().length>=10?"${title!.substring(0,10)}...": title!,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(.5.h),
                          height: 3.5.h,
                          width: 3.5.h,
                          decoration: const BoxDecoration(
                              color: MyColor.blackBoldColor,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset('assets/svg/email.svg')),
                      getHorizontalSpace(.8.h),
                      Container(
                          padding: EdgeInsets.all(.5.h),
                          height: 3.5.h,
                          width: 3.5.h,
                          decoration: const BoxDecoration(
                              color: MyColor.blackBoldColor,
                              shape: BoxShape.circle),
                          child:
                          SvgPicture.asset('assets/svg/videocall.svg')),
                      getHorizontalSpace(.8.h),
                      Container(
                          padding: EdgeInsets.all(.5.h),
                          height: 3.5.h,
                          width: 3.5.h,
                          decoration: const BoxDecoration(
                              color: MyColor.blackBoldColor,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset('assets/svg/message.svg')),
                      getHorizontalSpace(.6.h),
                    ],
                  )
                ],
              )),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.3.h),
              child: Column(
                children: [
                  getVerticalSpace(3.8.h),
                  Container(
                    alignment: Alignment.center,
                    height: 3.2.h,
                    width: 6.3.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.px)),
                    child: const Text(
                      'Today',
                    ),
                  ),
                  Obx(
                        () => ListView.builder(
                      itemCount: chatList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [

                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 2.5.h,
                                  backgroundImage: AssetImage(imagePath!),
                                ),
                                getHorizontalSpace(1.5.h),
                                Container(
                                  margin:
                                  EdgeInsets.symmetric(vertical: 1.h),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(1.h),
                                  decoration: BoxDecoration(
                                      color: MyColor.blackBoldColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.px),
                                        bottomRight: Radius.circular(10.px),
                                        topRight: Radius.circular(10.px),
                                      )),
                                  child: Text(
                                    chatList[index],
                                    style: TextStyle(
                                        fontFamily: 'medium',
                                        color: const Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.px),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: .8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: Row(
                            children: [

                              getHorizontalSpace(.8.h),
                              Expanded(
                                child: TextFormField(
                                  controller: chatController,
                                  onChanged: (value) {
                                    messageLength.value = value;
                                  },
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      fillColor: const Color(0xffF8F8F8),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(2.h)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(2.h),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      enabled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(2.h),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      prefixIcon: Container(
                                          padding: EdgeInsets.all(1.4.h),
                                          height: 1.5.h,
                                          width: 1.5.h,
                                          child: ClipPath(
                                              child: SvgPicture.asset(
                                                'assets/svg/attach.svg',
                                                fit: BoxFit.cover,
                                              ))),
                                      suffixIcon:  Container(   padding: EdgeInsets.all(1.4.h),
                                          height: 1.5.h,
                                          width: 1.5.h,
                                          child: ClipPath(
                                              child: SvgPicture.asset('assets/svg/camera.svg',
                                                fit: BoxFit.cover,))),
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 1.3.h),
                                      hintText: 'Write your message',
                                      hintStyle: TextStyle(
                                          fontSize: 12.px,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'medium',
                                          color: const Color(0xff9D9D9D))),
                                ),
                              ),
                              getHorizontalSpace(.8.h),

                            ],
                          ),
                        ),
                      ),
                      getHorizontalSpace(1.h),
                      GestureDetector(
                        onTap: () {
                          chatList.add(chatController.text);
                          chatController.clear();
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.4.h),
                          height: 5.h,
                          width: 5.h,
                          decoration: const BoxDecoration(
                            color: MyColor.blackBoldColor,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/arrow.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  getVerticalSpace(2.2.h)
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
