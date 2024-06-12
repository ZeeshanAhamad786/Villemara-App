import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/my_color.dart';
class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  List<String> data=[
    "assets/png/profile.png",
    "assets/png/profile2.png",
    "assets/png/profile3.png",
    "assets/png/profile2.png",
    "assets/png/profile.png",
    "assets/png/profile3.png",
    "assets/png/profile.png",
    "assets/png/profile2.png",
    "assets/png/profile.png",
  ];
  List<String> data1=[
    "Zeeshan",
    "Usman",
    "Ali",
    "usman",
    "usman",
    "usman",
    "usman",
    "usman",
    "usman",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new, size: 18.px)),
            Text("Likes", style: Constant.textLikes),
            SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svg/heart.svg"),
              getHorizontalSpace(.4.w),
              Text("100"),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
                itemBuilder: (context,index){return
              Container(
                margin: EdgeInsets.symmetric(vertical: 3.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(data[index]),
                          radius: 20,
                        ),
                        getHorizontalSpace(2.w),
                        Expanded(
                            child: TextFormField(decoration: InputDecoration.collapsed(hintText: data1[index]),style: Constant.textLikeName,))
                      ],
                    ),
                    Divider(color: MyColor.dividerColor),
                  ],
                ),
              );
            }),
          ),

        ],),
      ),
    );
  }
}
