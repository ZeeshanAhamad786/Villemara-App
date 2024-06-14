import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/screens/home_section/home_screen.dart';
import 'package:villemara_app/view/screens/profile_section/main_profile_screen.dart';
import 'package:villemara_app/view/screens/project_section/my_project_with_Add_New.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (buildContext, orientation, screenType){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home:  const MyProjectAddNew(),
      );
    });
  }
}
