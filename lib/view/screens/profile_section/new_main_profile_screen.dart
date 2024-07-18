import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/profile_section/main_profile_screen.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import 'edit_info_screen.dart';
class NewMainProfileScreen extends StatelessWidget {
  const NewMainProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
      Stack(children: [
      Image.asset("assets/png/villemaraProfilepng.png"),
      Positioned(bottom: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:EdgeInsets.only(right: 4.w,left: 4.w,top: 4.w,bottom: 3.w) ,
          decoration: BoxDecoration(borderRadius:const BorderRadius.only(topRight: Radius.circular(10)),color: Colors.white.withOpacity(0.58)),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(()=>const MainProfileScreen());
                },
                  child: Icon(Icons.keyboard_arrow_up,size: 30.px,)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Lita Han",style: Constant.milkTate,),
                  GestureDetector(onTap: (){
                    Get.to(()=>const EditInfoScreen());
                  },
                      child: SvgPicture.asset("assets/svg/write.svg",)),
                  // getHorizontalSpace(1.w),
                  // Text("Say Hi",style: Constant.sayHi,),
                ],
              ),
              getVerticalSpace(1.w),
              Text("Taxes Real Estate Broker | Managing Broker | Principal Broker",style: Constant.sayHi),
              getVerticalSpace(3.w),
              Align(alignment: Alignment.centerLeft,
                  child: Text("Golden Globe Properties",style: Constant.litaEmail)),
              getVerticalSpace(2.w),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/svg/linkden.svg"),
                  getHorizontalSpace(1.5.w),
                  SvgPicture.asset("assets/svg/Instagram.svg"),
                  getHorizontalSpace(1.5.w),
                  SvgPicture.asset("assets/svg/facebook.svg"),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(top: 6.h,right: 5.h,
          child: Container(
              padding:EdgeInsets.only(right: 3.w,left: 3.w,top: 3.w,bottom: 3.w) ,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.58)),
              child: SvgPicture.asset("assets/svg/cameraIcon.svg")
          ))
      ],
      )
      ],),
    );
  }
}
