import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/model/comment_screen_model.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentScreenModel> data=[
    CommentScreenModel(imageUrl: 'assets/png/profile.png', name: 'zeeshan', reply: 'reply', allReply: '',
        nameDescription: 'Lorem ipsum dolor', time: '22m'),
    CommentScreenModel(imageUrl: 'assets/png/profile.png', name: 'zeeshan', reply: 'reply', allReply: 'View 5 replies',
        nameDescription: 'Lorem ipsum dolor', time: '2m'),
    CommentScreenModel(imageUrl: 'assets/png/profile.png', name: 'zeeshan', reply: 'reply', allReply: 'View 3 replies',
        nameDescription: 'Lorem ipsum dolor', time: '22m'),
    CommentScreenModel(imageUrl: 'assets/png/profile.png', name: 'zeeshan', reply: 'reply', allReply: 'View 4 replies',
        nameDescription: 'Lorem ipsum dolor', time: '2h'),
    CommentScreenModel(imageUrl: 'assets/png/profile.png', name: 'zeeshan', reply: 'reply', allReply: 'View 5 replies',
        nameDescription: 'Lorem ipsum dolor', time: '22m'),
    CommentScreenModel(imageUrl: 'assets/png/profile.png', name: 'zeeshan', reply: 'reply', allReply: 'View 3 replies',
        nameDescription: 'Lorem ipsum dolor', time: '22m'),
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
            Text("Comments", style: Constant.textLikes),
            SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){return
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3.w),
                    child: Column(
                      children: [
                        Row(crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(data[index].imageUrl),
                              radius: 25,
                            ),
                            getHorizontalSpace(2.w),
                            Expanded(
                                child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(data[index].name, style: Constant.textLikeName,),
                                        getHorizontalSpace(1.w),
                                        Text(data[index].time, style: Constant.commentsTime,),
                                      ],
                                    ),
                                    Text(data[index].nameDescription,style: Constant.commentsDesc,),
                                    Text(data[index].reply,style: Constant.commentsReply,),
                                    Text(data[index].allReply,style: Constant.commentsReply,),
                                  ],
                                ))
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
