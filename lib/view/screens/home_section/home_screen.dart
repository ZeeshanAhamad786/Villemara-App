import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/customtextfield.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';

import '../../../controller/custom_widgets/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images=[
    "assets/png/profile2.png",
    "assets/png/profile3.png",
    "assets/png/profile4.png",
    "assets/png/profile5.png",
  ];
  List<String> profileNames=[
    "zeeshan",
    "Ahmad",
    "Umer",
    "Abdullah",
    "Ramzan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          children: [
            getVerticalSpace(8.h),
            TextFormField(
              cursorColor: MyColor.blackBoldColor,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: MyColor.greyLightColor,
                  isDense: true,
                  prefixIcon: Transform.scale(
                      scale: 0.6,
                      child: SvgPicture.asset("assets/svg/search1svg.svg")),
                  suffixIcon: Container(
                    width: 30,
                    height: 40,
                    decoration: BoxDecoration(
                        color:MyColor.blackBoldColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Transform.scale(scale: 0.5,
                        child: SvgPicture.asset("assets/svg/filter.svg")),
                  ),
                  hintText: "Search",
                  hintStyle: Constant.textSearch,
                  contentPadding: EdgeInsets.all(8),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: MyColor.blackBoldColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: MyColor.SearchColor)),),
            ),
            getVerticalSpace(3.h),
            Expanded(
              child: SizedBox(height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                    itemBuilder: (context,index){
                  return  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(index ==0)
                            Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/png/profile.png"),
                                radius: 36,
                              ),
                              Positioned(
                                bottom: 0,
                                right: .2,
                                child: Center(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: MyColor.blackBoldColor ),
                                    child: Transform.scale(
                                        scale: 0.5,
                                        child:  Icon(Icons.add,color: Colors.white,size: 30.px,)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                            getHorizontalSpace(.5.h),
                            CircleAvatar(
                              backgroundImage: AssetImage(images[index]),
                              radius: 36,
                            ),
                          ],
                        ),
                      ),
                        SizedBox(height: 4), // Space between image and name
                      Text(
                      profileNames[index],
                      style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      ),
                      )
                    ],
                  );
                }
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
