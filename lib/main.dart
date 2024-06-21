import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FaceCamera.initialize(); //Add this

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (buildContext, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const SplashScreen(),
      );
    });
  }
}
