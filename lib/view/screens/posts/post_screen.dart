import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/customtextfield.dart';
import '../../../controller/custom_widgets/my_color.dart';
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
  List<MainProfileModel> data1=[
    MainProfileModel(imageUrl: 'assets/png/fireBackground.png', profileName: 'Mike Tate', title: 'Taxes Real Estate Broker',
        profileImage: 'assets/png/profile2.png',
        litaHan: 'Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.',
        category: 'Renting', time: '2 hrs ago',
        tags: '#DreamHome #HomeForSale #PropertyListing #HouseHunting #DreamHouse #HomeSweetHome  #LuxuryLiving #RealEstateForSale #NewListing #HouseofTheDay')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          getVerticalSpace(4.h),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
              itemCount: data1.length,
              itemBuilder: (context,index){
            return
                Column(children: [
                  Stack(children: [
                    Image.asset(data1[index].imageUrl),
                    Container(
                      margin: EdgeInsets.only(left: 1.h,right: 25.w,top: 1.h),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.6) ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage("assets/png/profile2.png"),radius: 20,),
                          getHorizontalSpace(0.5.w),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data1[index].profileName,style: Constant.textName,),
                                Text(data1[index].title,style: Constant.textSubtitle,),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      child: GestureDetector(onTap:() {
                        Get.to(()=>const LikeScreen());
                      },
                        child: Container(
                          margin: EdgeInsets.only(left: 1.5.h,),
                          padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.h,left: 1.h),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white.withOpacity(0.6) ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/good.svg"),
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
                          child: Text(data1[index].litaHan,
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
                          child: Text(data1[index].category,
                            style:Constant.textDesc ,)),
                    ],
                  ),
                  getVerticalSpace(1.h),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(data1[index].profileImage),
                        radius: 20,
                      ),
                      getHorizontalSpace(1.w),
                      Expanded(
                          child: TextFormField(decoration: const InputDecoration.collapsed(hintText: "Add a comment..."),style: Constant.textSearch,))
                    ],
                  ),
                  getVerticalSpace(2.h),
                  Align(alignment: Alignment.centerLeft,
                      child: Text(data1[index].time,style: Constant.textDesc,)),
                  Text(data1[index].tags
                    ,style:Constant.textDesc ,),
                ],);
          }),

          const Divider(color: MyColor.greyColor,),
          getVerticalSpace(3.h),
          Container(
            margin: EdgeInsets.only(left: 1.h,right: 25.w,top: 1.h),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.SearchColor.withOpacity(0.8) ),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(backgroundImage: AssetImage("assets/png/profile2.png"),radius: 20,),
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
          const Align(alignment:Alignment.centerLeft ,
              child: Text("Agree 💯")),
          Text("""It doesn’t matter how impressive your accomplishments are – potential customers will avoid you if you don’t seem like an appealing person to work with. That’s why showing your human side is one of the most important things you can do in your real estate Business."""
            ,style:Constant.textDesc,),
          getVerticalSpace(1.h),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/png/profile4.png"),
                radius: 20,
              ),
              getHorizontalSpace(1.w),
              Expanded(
                  child: TextFormField(decoration: const InputDecoration.collapsed(hintText: "Add a comment..."),style: Constant.textSearch,))
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
                Get.to(()=>const LikeScreen());
              },
                child: Container(
                  // margin: EdgeInsets.only(left: 1.5.h,),
                  padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.h,left: 1.h),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: MyColor.SearchColor.withOpacity(0.8) ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/good.svg"),
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
        ],),
      ),
    );
  }
}





