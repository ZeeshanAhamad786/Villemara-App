import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/add_post_section/add_post_screen.dart';
import 'package:villemara_app/view/screens/add_post_section/play_story_screen.dart';
import 'package:villemara_app/view/screens/bottom_navigation_bar.dart';
import 'package:villemara_app/view/screens/home_section/home_screen.dart';
import 'package:villemara_app/view/screens/home_section/story_screen.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (BuildContext, Orientation, ScreenType){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home:   BottomNavigationScreen(),
      );
    });
  }
}
