import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:villemara_app/controller/custom_widgets/my_color.dart';
import 'package:villemara_app/view/screens/profile_section/main_profile_screen.dart';
import 'package:villemara_app/view/screens/profile_section/new_main_profile_screen.dart';

import 'add_post_section/upload_posts_tabbar.dart';
import 'blogs_secton/blogs_screen.dart';
import 'chat_section/tab_bar.dart';
import 'home_section/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  final String? title;
  const BottomNavigationScreen({super.key,  this.title});

  @override
  BottomNavigationScreenState createState() => BottomNavigationScreenState();
}

class BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ChatTabBar(),
    const BlogsScreen(),
    const NewMainProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyColor.white,
        body: _screens[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor:MyColor.blackBold,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            Get.to(()=>const UploadPostsTabBar());
          },
          child: SvgPicture.asset("assets/svg/floatIcon.svg")
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color:MyColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 0,
            color: Colors.white,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildNavItem(0, 'assets/svg/homeImage.svg', 'Home'),
                    buildNavItem(1, 'assets/svg/chatImage.svg', 'Chats'),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildNavItem(2, 'assets/svg/blogs.svg', 'Blogs'),
                    buildNavItem(3, 'assets/svg/profile.svg', 'Profile'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(int index, String assetPath, String label) {
    final bool isSelected = _selectedIndex == index;
    final Color color = isSelected ? MyColor.blackBoldColor: MyColor.textGrey;

    return MaterialButton(
      minWidth: 0,
      onPressed: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,height: 24.px,width: 24.px,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(color: color,fontFamily: "regular"),
          ),
        ],
      ),
    );
  }
}



