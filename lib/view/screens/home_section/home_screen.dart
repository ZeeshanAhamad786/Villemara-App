import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/home_section/comment_screen.dart';
import 'package:villemara_app/view/screens/home_section/like_screen.dart';
import 'package:villemara_app/view/screens/home_section/search_filter_screen.dart';
import 'package:villemara_app/view/screens/home_section/share_screen.dart';
import 'package:villemara_app/view/screens/home_section/story_screen.dart';

import '../../../controller/custom_widgets/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/png/profile.png",
    "assets/png/profile2.png",
    "assets/png/profile3.png",
    "assets/png/profile4.png",
    "assets/png/profile5.png",
  ];

  List<String> profileNames = [
    "zeeshan",
    "Ahmad",
    "Umer",
    "Abdullah",
    "Ramzan",
  ];
RxBool isSelected=false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child:
         Obx(()=> Column(
           children: [
             getVerticalSpace(8.h),

             isSelected.value?
             TextFormField(
               cursorColor: MyColor.blackBoldColor,
               decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white,
                 isDense: true,
                 prefixIcon: Transform.scale(
                   scale: 0.5,
                   child: GestureDetector(onTap: () {
                     Get.to(()=>const SearchFilterScreen());
                   },
                       child: SvgPicture.asset("assets/svg/filter.svg")),
                 ),
                 suffixIcon: Padding(
                   padding:  EdgeInsets.all(6.px),
                   child: Container(
                     decoration:BoxDecoration(borderRadius: BorderRadius.circular(30),color:
                     Colors.white,boxShadow: [
                       BoxShadow(color:MyColor.blackBoldColor.withOpacity(0.1),blurRadius: 8,
                           offset: Offset(1, 1),spreadRadius: 0 )
                     ]),
                     child: Transform.scale(scale: 0.5,
                         child: SvgPicture.asset("assets/svg/cancel.svg")),
                   ),
                 ),
                 hintText: "Search",
                 hintStyle: Constant.textSearch,
                 contentPadding: EdgeInsets.all(8),
                 focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(30),
                   borderSide: BorderSide(color: MyColor.blackBoldColor),
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(30),
                   borderSide: BorderSide(color: MyColor.SearchColor),
                 ),
               ),
             )  :Row(
               children: [
                 SvgPicture.asset("assets/svg/villemeraLogo.svg"),
                 Expanded(child: SizedBox()),
                 GestureDetector(onTap:() {
                   isSelected.value=true;
                 },
                   child: Container(
                     height: 40.px,width: 40.px,
                     decoration:BoxDecoration(borderRadius: BorderRadius.circular(30),color:
                     Colors.white,boxShadow: [
                       BoxShadow(color:MyColor.blackBoldColor.withOpacity(0.1),blurRadius: 8,
                           offset: Offset(1, 1),spreadRadius: 0 )
                     ]),
                     child: Transform.scale(scale: 0.5,
                         child: SvgPicture.asset("assets/svg/search1svg.svg")),
                   ),
                 ),
                 getHorizontalSpace(2.w),
                 Container(
                   height: 40.px,width: 40.px,
                   decoration:BoxDecoration(borderRadius: BorderRadius.circular(30),color:
                   Colors.white,boxShadow: [
                     BoxShadow(color:MyColor.blackBoldColor.withOpacity(0.1),blurRadius: 8,
                         offset: Offset(1, 1),spreadRadius: 0 )
                   ]),
                   child: Transform.scale(scale: 0.5,
                       child: SvgPicture.asset("assets/svg/notification.svg")),
                 )
               ],
             ),
             getVerticalSpace(3.h),
             SizedBox(
               height: MediaQuery.of(context).size.height/8,
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: images.length,
                 itemBuilder: (context, index) {
                   return GestureDetector(onTap: () {
                     Get.to(()=>StoryScreen());
                   },
                     child: Container(
                       margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                       child: Column(
                         children: [
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Stack(
                                 children: [
                                   CircleAvatar(
                                     backgroundImage: AssetImage(images[index]),
                                     radius: 30,
                                   ),
                                   if (index == 0) // Only show the 'add' icon for the first image
                                     Positioned(
                                       bottom: 0,
                                       right: .2,
                                       child: Center(
                                         child: Container(
                                           height: 30,
                                           width: 30,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(30),
                                             color: MyColor.blackBoldColor,
                                           ),
                                           child: Transform.scale(
                                             scale: 0.5,
                                             child: Icon(
                                               Icons.add,
                                               color: Colors.white,
                                               size: 30.px,
                                             ),
                                           ),
                                         ),
                                       ),
                                     ),
                                 ],
                               ),
                               getHorizontalSpace(.5.h),
                             ],
                           ),
                           getVerticalSpace(0.5.h),
                           Text(
                             profileNames[index],
                             style: TextStyle(
                               fontSize: 14.sp,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 },
               ),
             ),
             getVerticalSpace(2.h),
             Stack(children: [
               Image.asset("assets/png/backgrounImage.png"),
               Container(
                 margin: EdgeInsets.only(left: 1.h,right: 25.w,top: 1.h),
                 padding: EdgeInsets.all(4),
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.6) ),
                 child: Row(mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     CircleAvatar(backgroundImage: AssetImage("assets/png/profile2.png"),radius: 20,),
                     getHorizontalSpace(0.5.w),
                     Expanded(
                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Lita Han",style: Constant.textName,),
                           Text("Taxes Real Estate Broker",style: Constant.textSubtitle,),

                         ],
                       ),
                     ),

                   ],
                 ),
               ),
               Positioned(
                 bottom: 8,
                 child: GestureDetector(onTap:() {
                   Get.to(()=>LikeScreen());
                 },
                   child: Container(
                     margin: EdgeInsets.only(left: 1.5.h,),
                     padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.h,left: 1.h),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.6) ),
                     child: Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset("assets/svg/heart.svg"),
                         getHorizontalSpace(0.5.h),
                         Text("12K",style: Constant.textName,),
                       ],
                     ),
                   ),
                 ),
               ),
               Positioned(
                 bottom: 8,
                 left: 10.h,
                 child: GestureDetector(onTap:() {
                   Get.to(()=>const CommentScreen());
                 },
                   child: Container(
                     padding:  EdgeInsets.only(top: 1.3.h,bottom: 1.3.h,right: 1.h,left: 1.h),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.6) ),
                     child: Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset("assets/svg/comments.svg"),
                         getHorizontalSpace(0.5.h),
                         Text("12K",style: Constant.textName,),
                       ],
                     ),
                   ),
                 ),
               ),
               Positioned(
                 bottom: 8,
                 right: 2.h,
                 child: GestureDetector(onTap: () {
                   Get.to(()=>const ShareScreen());
                 },
                   child: Container(
                       margin: EdgeInsets.only(left: 1.h,),
                       padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.5.h,left: 1.5.h),
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.6) ),
                       child: SvgPicture.asset("assets/svg/share.svg")
                   ),
                 ),
               )
             ],),
             getVerticalSpace(2.h),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("data:",style: Constant.textName,),
                 getHorizontalSpace(.5.h),
                 Expanded(
                     child: Text("Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.",
                       style:Constant.textDesc ,)),
               ],
             ),
             getVerticalSpace(1.h),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Category:",style: Constant.textName,),
                 getHorizontalSpace(.5.h),
                 Expanded(
                     child: Text("Renting",
                       style:Constant.textDesc ,)),
               ],
             ),
             getVerticalSpace(1.h),
             Row(
               children: [
                 CircleAvatar(
                   backgroundImage: AssetImage("assets/png/profile4.png"),
                   radius: 20,
                 ),
                 getHorizontalSpace(1.w),
                 Expanded(
                     child: TextFormField(decoration: InputDecoration.collapsed(hintText: "Add a comment..."),style: Constant.textSearch,))
               ],
             ),
             getVerticalSpace(2.h),
             Align(alignment: Alignment.centerLeft,
                 child: Text("2 hrs ago",style: Constant.textDesc,)),
             Text("""#DreamHome #HomeForSale #PropertyListing #HouseHunting #DreamHouse #HomeSweetHome  #LuxuryLiving #RealEstateForSale #NewListing #HouseofTheDay"""
               ,style:Constant.textDesc ,),
             Divider(color: MyColor.greyColor,),
             getVerticalSpace(3.h),
             Container(
               margin: EdgeInsets.only(left: 1.h,right: 25.w,top: 1.h),
               padding: EdgeInsets.all(4),
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.SearchColor.withOpacity(0.8) ),
               child: Row(mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   CircleAvatar(backgroundImage: AssetImage("assets/png/profile2.png"),radius: 20,),
                   getHorizontalSpace(0.5.w),
                   Expanded(
                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Lita Han",style: Constant.textName,),
                         Text("Taxes Real Estate Broker",style: Constant.textSubtitle,),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
             Align(alignment:Alignment.centerLeft ,
                 child: Text("Agree 💯")),
             Text("""It doesn’t matter how impressive your accomplishments are – potential customers will avoid you if you don’t seem like an appealing person to work with. That’s why showing your human side is one of the most important things you can do in your real estate Business."""
               ,style:Constant.textDesc,),
             getVerticalSpace(1.h),
             Row(
               children: [
                 CircleAvatar(
                   backgroundImage: AssetImage("assets/png/profile4.png"),
                   radius: 20,
                 ),
                 getHorizontalSpace(1.w),
                 Expanded(
                     child: TextFormField(decoration: InputDecoration.collapsed(hintText: "Add a comment..."),style: Constant.textSearch,))
               ],
             ),
             getVerticalSpace(2.h),
             Align(alignment: Alignment.centerLeft,
                 child: Text("2 hrs ago",style: Constant.textDesc,)),
             Text("""#DreamHome #HomeForSale #PropertyListing #HouseHunting #DreamHouse #HomeSweetHome  #LuxuryLiving #RealEstateForSale #NewListing #HouseofTheDay"""
               ,style:Constant.textDesc ,),
             getVerticalSpace(2.h),
             Row(
               children: [
                 GestureDetector(onTap:() {
             Get.to(()=>LikeScreen());
                 },
                   child: Container(
                     // margin: EdgeInsets.only(left: 1.5.h,),
                     padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.h,left: 1.h),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.SearchColor.withOpacity(0.8) ),
                     child: Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset("assets/svg/heart.svg"),
                         getHorizontalSpace(0.5.h),
                         Text("12K",style: Constant.textName,),
                       ],
                     ),
                   ),
                 ),
                 getHorizontalSpace(1.w),
                 GestureDetector(
                   onTap: () {
                     Get.to(()=>CommentScreen());
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
                 Expanded(child: SizedBox()),
                 GestureDetector(onTap:() {
                   Get.to(()=>ShareScreen());
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

             Divider(color: MyColor.greyColor,),
           ],
         ),)
        ),
      ),
    );
  }
}
