import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';

import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/my_color.dart';
class ViewsStoryScreen extends StatefulWidget {
  const ViewsStoryScreen({Key? key}) : super(key: key);

  @override
  State<ViewsStoryScreen> createState() => _ViewsStoryScreenState();
}

class _ViewsStoryScreenState extends State<ViewsStoryScreen> {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Story Views", style: Constant.textLikes.copyWith(fontSize: 13.px,color: const Color(0xff000E08))),
            Text("2k", style: Constant.textLikes.copyWith(fontSize: 13.px,color: const Color(0xff000E08))),
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
