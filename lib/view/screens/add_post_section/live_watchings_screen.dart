import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

import '../../../controller/custom_widgets/constant.dart';
class LiveWatchingsScreen extends StatefulWidget {
  const LiveWatchingsScreen({Key? key}) : super(key: key);

  @override
  State<LiveWatchingsScreen> createState() => _LiveWatchingsScreenState();
}

class _LiveWatchingsScreenState extends State<LiveWatchingsScreen> {
  List<String> data=[
    "assets/png/john.png",
    "assets/png/lica.png",
    "assets/png/john.png",
    "assets/png/lica.png",
    "assets/png/john.png",
    "assets/png/lica.png",
    "assets/png/john.png",
    "assets/png/lica.png",
    "assets/png/john.png",
    "assets/png/lica.png",
    "assets/png/john.png",
  ];
  List<String> data1=[
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [ GestureDetector(onTap: () {
              Get.back();
            },
                child: Icon(Icons.arrow_back_ios_new_sharp,size: 2.3.h,)),
              getHorizontalSpace(3.h),

              Text("Watching", style: Constant.textLikes.copyWith(fontSize: 13.px,color: const Color(0xff000E08))),
            ],),
             Text("2.3k", style: Constant.textLikes.copyWith(fontSize: 13.px,color: const Color(0xff000E08))),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (context,index){return
                  Container(padding: EdgeInsets.symmetric(
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
                        CircleAvatar(
                          backgroundImage: AssetImage(data[index]),
                          radius: 20,
                        ),
                        getHorizontalSpace(2.w),
                        Expanded(
                            child: TextFormField(decoration: InputDecoration.collapsed(hintText: data1[index]),style: Constant.textLikeName,))
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
