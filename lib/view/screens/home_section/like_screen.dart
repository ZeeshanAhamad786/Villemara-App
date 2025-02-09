import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

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
            const SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/png/thumb.png"),
              getHorizontalSpace(.4.w),
              const Text("100"),
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
                        getHorizontalSpace(2.h),
                        // Expanded(
                        //     child: TextFormField(decoration: InputDecoration.collapsed(hintText: data1[index]),style: Constant.textLikeName,))
                      Text(data1[index],style: TextStyle(fontFamily: 'medium',color: const Color(0xff444444),fontSize: 14.px,fontWeight: FontWeight.w400),)
                      ],
                    ),
                    const Divider(color: MyColor.dividerColor),
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
