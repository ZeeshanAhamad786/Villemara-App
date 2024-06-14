import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/view/screens/project_section/project_screen.dart';
import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/my_color.dart';
import '../../../model/company_model.dart';
import '../../../model/main_profile_model.dart';
import '../home_section/comment_screen.dart';
import '../home_section/like_screen.dart';
import '../home_section/share_screen.dart';
class OtherUserProfileScreen extends StatefulWidget {
  const OtherUserProfileScreen({Key? key}) : super(key: key);

  @override
  State<OtherUserProfileScreen> createState() => _OtherUserProfileScreenState();
}

class _OtherUserProfileScreenState extends State<OtherUserProfileScreen> {
  List<CompanyModel> data=[
    CompanyModel(imageUrl: 'assets/png/companyLogo.png', companyName: 'Miami Brokers', present: 'present', designation: 'Managing Broker',
        currentCompany: 'Miami ',
        description: 'Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.Vitae id nam eros elit eu tempor cursus a luctus.', ),
    CompanyModel(imageUrl: 'assets/png/companyLogo.png', companyName: 'Miami Brokers', present: 'Apr, 2017 - Sep, 2022', designation: 'Managing Broker',
      currentCompany: 'Miami ',
      description: 'Lorem ipsum dolor sit amet consectetur. Vitae id nam eros elit eu tempor cursus a luctus.Vitae id nam eros elit eu tempor cursus a luctus.', )
  ];
  List<MainProfileModel> data1=[
    MainProfileModel(imageUrl: 'assets/png/backgrounImage.png', profileName: 'Mike Tate', title: 'Taxes Real Estate Broker',
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
          Stack(children: [
            Image.asset("assets/png/mainProfile.png"),
            Positioned(bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:EdgeInsets.only(right: 3.w,left: 2.w,top: 2.w,bottom: 1.w) ,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10)),color: Colors.white.withOpacity(0.58)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Mike Tate",style: Constant.milkTate,),
                        Spacer(),
                        Image.asset("assets/png/hand.png",width: 19.px,height: 19.px,),
                        getHorizontalSpace(1.w),
                        Text("Say Hi",style: Constant.sayHi,),
                      ],
                    ),
                    getVerticalSpace(1.w),
                    Text("Taxes Real Estate Broker | Managing Broker | Principal Broker",style: Constant.sayHi),
                    getVerticalSpace(1.w),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Litahan@gmail.com",style: Constant.litaEmail,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                          decoration: BoxDecoration(
                            color: MyColor.blackBoldColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Book Appointment", style: Constant.textDone),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],),
          getVerticalSpace(3.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Projects",style: Constant.projects,),
                    GestureDetector(onTap: () {
                      Get.to(()=>ProjectScreen());
                    },
                        child: Text("View All",style: Constant.litaEmail,)),
                  ],
                ),
                getVerticalSpace(1.h),
                Row(
                  children: [
                    Expanded(child: Image.asset("assets/png/project1.png",fit: BoxFit.contain,)),
                    getHorizontalSpace(2.w),
                    Expanded(
                        child: Image.asset("assets/png/project2.png",fit: BoxFit.contain,)),
                  ],
                ),
                getVerticalSpace(2.5.h),
                Align(alignment: Alignment.centerLeft,
                    child: Text("Company",style: Constant.projects,)),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                             height: 50.px,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                  ),
                               child: Image.asset(data[index].imageUrl,fit: BoxFit.cover,),
                            ),
                            getHorizontalSpace(2.w),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index].companyName,style: Constant.companyName,),
                                  getVerticalSpace(0.2.h),
                                  Text(data[index].designation,style: Constant.designation,),
                                  getVerticalSpace(0.2.h),
                                  Text(data[index].present,style: Constant.currentJob,),
                                  getVerticalSpace(0.2.h),
                                  Text(data[index].currentCompany,style: Constant.currentJob,),
                                ],
                              ),
                            )
                          ],
                        ),
                        getVerticalSpace(0.5.h),
                        Text(data[index].description,style: Constant.currentJob,)
                      ],
                    ),
                  );
                }),
                getVerticalSpace(3.h),
                Align(alignment: Alignment.centerLeft,
                    child: Text("Posts/Listings",style: Constant.projects,)),

                //ListView Builder
                getVerticalSpace(2.h),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: data1.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Image.asset(data1[index].imageUrl),
                        Container(
                          margin: EdgeInsets.only(left: 1.h, right: 25.w, top: 1.h),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.6),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(data1[index].profileImage),
                                radius: 20,
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
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
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const LikeScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 1.5.h,),
                              padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.h,left: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/svg/heart.svg"),
                                  SizedBox(width: 8),
                                  Text("12K", style: Constant.textName),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 8,
                          left: 10.h,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const CommentScreen());
                            },
                            child: Container(
                              padding:  EdgeInsets.only(top: 1.3.h,bottom: 1.3.h,right: 1.h,left: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/svg/comments.svg"),
                                  SizedBox(width: 8),
                                  Text("12K", style: Constant.textName),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 2.h,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const ShareScreen());
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 1.h,),
                              padding:  EdgeInsets.only(top: 1.4.h,bottom: 1.4.h,right: 1.5.h,left: 1.5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: SvgPicture.asset("assets/svg/share.svg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("data:", style: Constant.textName),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            data1[index].litaHan,
                            style: Constant.currentJob,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category:", style: Constant.textName),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            data1[index].category,
                            style: Constant.currentJob,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/png/profile4.png"),
                          radius: 20,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Add a comment...",
                            ),
                            style: Constant.currentJob,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("2 hrs ago", style: Constant.currentJob),
                    ),
                    SizedBox(height: 8),
                    Text(
                      data1[index].tags,
                      style: Constant.currentJob,
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),







            Divider(color: MyColor.greyColor,),
                getVerticalSpace(3.h),
                Container(
                  margin: EdgeInsets.only(right: 25.w,top: 1.h),
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
                  ,style:Constant.currentJob,),
                getVerticalSpace(1.h),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/png/profile4.png"),
                      radius: 20,
                    ),
                    getHorizontalSpace(1.w),
                    Expanded(
                        child: TextFormField(decoration: InputDecoration.collapsed(hintText: "Add a comment..."),style: Constant.currentJob,))
                  ],
                ),
                getVerticalSpace(2.h),
                Align(alignment: Alignment.centerLeft,
                    child: Text("2 hrs ago",style: Constant.currentJob,)),
                Text("""#DreamHome #HomeForSale #PropertyListing #HouseHunting #DreamHouse #HomeSweetHome  #LuxuryLiving #RealEstateForSale #NewListing #HouseofTheDay"""
                  ,style:Constant.currentJob ,),
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
            ),
          )
        ],),
      ),
    );
  }
}
