import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/model/share_screen_model.dart';

import '../../../controller/custom_widgets/constant.dart';
import '../../../controller/custom_widgets/customtextfield.dart';
class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final RxList<ShareScreenModel> items = [
    ShareScreenModel(imageUrl: 'assets/png/profile3.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile.png', name: 'Zeeshan', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile4.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile3.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile3.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile4.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile3.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
    ShareScreenModel(imageUrl: 'assets/png/profile4.png', name: 'Lita Han', title: 'Taxes Real Estate Broker', selected: false),
  ].obs;
  @override
  Widget build(BuildContext context) {
    return
     Obx(() =>  Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         title: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             GestureDetector(onTap: () {
               Get.back();
             },
                 child: Icon(Icons.arrow_back_ios_new, size: 18.px)),
             Text("Share", style: Constant.textLikes),
             SizedBox(height: 10, width: 10)
           ],
         ),
       ),
       body: Column(children: [
         Text("Choose person to share post with",style: Constant.choosePerson,),
         getVerticalSpace(3.h),
         Expanded(
           child: ListView.builder(
               padding: EdgeInsets.zero,
               itemCount: items.length,
               shrinkWrap: true,
               itemBuilder: (BuildContext, index) {
                 return GestureDetector(
                   onTap: () {
                     items[index].selected = !items[index].selected;
                     items.refresh();
                     log("the value is");
                     log(items.toString());
                   },
                   child: Column(
                     children: [
                       ListTile(
                         title: Text(
                           items[index].name,
                           // style: CustomTextStyle.mediumTextTitle,
                         ),
                         subtitle: Text(
                           items[index].title,
                           // style: CustomTextStyle.mediumTextSubtitle,
                         ),
                         leading: CircleAvatar(
                           maxRadius: 30,
                           backgroundImage: AssetImage(items[index].imageUrl),
                         ),
                         trailing: Container(
                           height: 20,
                           width: 20,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               border: Border.all(color: MyColor.blackBold)),
                           child: items[index].selected
                               ? Icon(
                             Icons.check,
                             size: 12,
                           )
                               : null,
                         ),
                       ),
                       Divider(color: MyColor.dividerColor,)
                     ],
                   ),
                 );
               }),
         )
       ],),
     ));
  }
}
