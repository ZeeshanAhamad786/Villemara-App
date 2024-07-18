import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:villemara_app/model/main_profile_model_description.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
import '../../../model/main_profile_model.dart';
import '../home_section/comment_screen.dart';
import '../home_section/like_screen.dart';
import '../home_section/share_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<MainProfileModel> data1 = [
    MainProfileModel(
        imageUrl: 'assets/png/fireBackground.png',
        profileName: 'Mike Tate',
        title: 'Taxes Real Estate Broker',
        profileImage: 'assets/png/profile2.png',
        litaHan: """Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.""",
        category: 'Renting',
        time: '2 hrs ago',
        tags: '#DreamHome #HomeForSale #PropertyListing #HouseHunting #DreamHouse #HomeSweetHome  #LuxuryLiving #RealEstateForSale #NewListing #HouseofTheDay'
    ),
  ];

  List<MainProfileModelDescription> data2 = [
    MainProfileModelDescription(
        profileName: 'Mike Tate',
        title: 'Taxes Real Estate Broker',
        profileImage: 'assets/png/profile2.png',
        litaHan: """It doesn’t matter how impressive your accomplishments are – potential customers will avoid you if you don’t seem like an appealing person to work with. That’s why showing your human side is one of the most important things you can do in your real estate Business.""",
        agree: 'Agree 💯',
        time: '2 hrs ago',
        tags: '#DreamHome #HomeForSale #PropertyListing #HouseHunting #DreamHouse #HomeSweetHome  #LuxuryLiving #RealEstateForSale #NewListing #HouseofTheDay'
    ),
  ];

  final imageUrl = [
    "assets/png/backgrounImage.png",
    "assets/png/backgrounImage.png",
    "assets/png/backgrounImage.png",
    "assets/png/backgrounImage.png",
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            getVerticalSpace(4.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data1.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: imageUrl.length,
                      itemBuilder: (BuildContext context, int imageIndex, realIdx) {
                        final url = imageUrl[imageIndex];
                        return Stack(
                          children: [
                            buildImage(url, imageIndex),
                            Container(
                              margin: EdgeInsets.only(left: 1.5.h, right: 25.w, top: 1.h),
                               padding:EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage("assets/png/profile2.png"),
                                    radius: 20,
                                  ),
                                  getHorizontalSpace(0.5.w),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data1[index].profileName, style: Constant.textName),
                                        Text(data1[index].title, style: Constant.textSubtitle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: .5.h,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const LikeScreen());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 1.h),
                                  padding: EdgeInsets.only(
                                      top: 0.8.h, bottom: 0.8.h, right: 0.6.h, left: 0.6.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/png/thumb.png"),
                                      getHorizontalSpace(0.5.h),
                                      Text("12K", style: Constant.textName),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 9.h,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const CommentScreen());
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 0.8.h, bottom: 0.8.h, right: 0.6.h, left: 0.6.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset("assets/svg/comments.svg"),
                                      getHorizontalSpace(0.5.h),
                                      Text("12K", style: Constant.textName),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(right:14.5.w,bottom:2.5.h,
                                child: buildIndicator()),
                            Positioned(
                              bottom: 8,
                              right: 1.5.h,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => const ShareScreen());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 1.h),
                                  padding: EdgeInsets.only(
                                      top: 0.8.h, bottom: 0.8.h, right: 0.8.h, left: 0.8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  child: SvgPicture.asset("assets/svg/share.svg"),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 200.px,
                        onPageChanged: (index, reason) => setState(() => activeIndex = index),
                      ),
                    ),
                    getVerticalSpace(1.h),

                    getVerticalSpace(2.h),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(text: "Lita Han: ", style: Constant.textName),
                          TextSpan(text: data1[index].litaHan, style: Constant.tags),
                        ],
                      ),
                    ),

                    // getVerticalSpace(1.h),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text("Category:", style: Constant.textName),
                    //     getHorizontalSpace(.5.h),
                    //     Expanded(
                    //       child: Text(data1[index].category, style: Constant.textDesc),
                    //     ),
                    //   ],
                    // ),
                    getVerticalSpace(1.h),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(data1[index].profileImage),
                          radius: 20,
                        ),
                        getHorizontalSpace(1.w),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration.collapsed(hintText: "Add a comment..."),
                            style: Constant.tags,
                          ),
                        ),
                      ],
                    ),
                    getVerticalSpace(2.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(data1[index].time, style: Constant.text2h),
                    ),
                    Text(data1[index].tags, style: Constant.tags),
                  ],
                );
              },
            ),
            const Divider(color: MyColor.greyColor),
            getVerticalSpace(2.h),
            ListView.builder(
                itemCount: data2.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 1.h,right: 25.w,top: 1.h),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.SearchColor.withOpacity(0.8) ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundImage: AssetImage(data2[index].profileImage),radius: 20,),
                            getHorizontalSpace(0.5.w),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data2[index].profileName,style: Constant.textName,),
                                  Text(data2[index].title,style: Constant.textSubtitle,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(alignment:Alignment.centerLeft ,
                          child: Text(data2[index].agree)),
                      Text(data2[index].litaHan
                        ,style:Constant.onlyDesc,),
                      getVerticalSpace(1.h),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage("assets/png/profile4.png"),
                            radius: 20,
                          ),
                          getHorizontalSpace(1.w),
                          Expanded(
                              child: TextFormField(decoration:  InputDecoration.collapsed(
                                  hintText: "Add a comment...",hintStyle:TextStyle( fontSize: 12.px,
                                  fontWeight: FontWeight.w400,
                                  color: MyColor.greyColor,
                                  fontFamily: "medium")),))
                        ],
                      ),
                      getVerticalSpace(2.h),
                      Align(alignment: Alignment.centerLeft,
                          child: Text(data2[index].time,style: Constant.text2h,)),
                      Text(data2[index].tags
                        ,style:Constant.tags,),
                      getVerticalSpace(2.h),
                      Row(
                        children: [
                          GestureDetector(onTap:() {
                            Get.to(()=>const LikeScreen());
                          },
                            child: Container(
                              // margin: EdgeInsets.only(left: 1.5.h,),
                              padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.h,left: 1.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.SearchColor.withOpacity(0.8) ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/png/thumb.png"),
                                  getHorizontalSpace(0.5.h),
                                  Text("12K",style: Constant.textName,),
                                ],
                              ),
                            ),
                          ),
                          getHorizontalSpace(1.w),
                          GestureDetector(
                            onTap: () {
                              Get.to(()=>const CommentScreen());
                            },
                            child: Container(
                              padding:  EdgeInsets.only(top: 1.3.h,bottom: 1.3.h,right: 1.h,left: 1.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:MyColor.SearchColor.withOpacity(0.8) ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/svg/comments.svg"),
                                  getHorizontalSpace(0.5.h),
                                  Text("12K",style: Constant.textName,),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(onTap:() {
                            Get.to(()=>const ShareScreen());
                          },
                            child: Container(
                                margin: EdgeInsets.only(left: 1.h,),
                                padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.5.h,left: 1.5.h),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:MyColor.SearchColor.withOpacity(0.6) ),
                                child: SvgPicture.asset("assets/svg/share.svg")
                            ),
                          ),
                        ],
                      ),

                      const Divider(color: MyColor.greyColor,),
                      getVerticalSpace(6.h),
                    ],
                  );

                }
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: .2.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(urlImage), fit: BoxFit.cover),
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: imageUrl.length,
    effect: ExpandingDotsEffect(
      dotHeight: 1.h,
      dotWidth: 1.h,
      activeDotColor: MyColor.whiterColor,
      dotColor: MyColor.greyColor,
    ),
  );
}
