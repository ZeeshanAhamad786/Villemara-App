import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/customtextfield.dart';
import '../../../controller/utils/my_color.dart';
import '../bottom_navigation_bar.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  RxBool first = true.obs;
  RxBool second = false.obs;
  RxBool third = false.obs;
  RxBool fourth = false.obs;
  RxBool fifth = false.obs;
  RxBool six = false.obs;

  void _selectFilter(int index) {
    first.value = index == 0;
    second.value = index == 1;
    third.value = index == 2;
    fourth.value = index == 3;
    fifth.value = index == 4;
    six.value = index == 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new, size: 18.px),
            ),
            Text("Search Filters", style: Constant.simpleText),
            const SizedBox(height: 10, width: 10)
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              getVerticalSpace(5.h),
              _buildFilterRow(0, "Posts"),
              getVerticalSpace(3.h),
              _buildFilterRow(1, "Listings"),
              getVerticalSpace(3.h),
              Align(alignment: Alignment.centerLeft,
                  child: Text("Listing Categories",style: Constant.textDesc,)),
              getVerticalSpace(3.h),
              _buildFilterRow(2, "Renting"),
              getVerticalSpace(3.h),
              _buildFilterRow(3, "developments"),
              getVerticalSpace(3.h),
              _buildFilterRow(4, "joint ventures"),
              getVerticalSpace(3.h),
              _buildFilterRow(5, "Special Purpose Vehicles"),
              getVerticalSpace(4.h),
              GestureDetector(
                onTap: () {
                  Get.to(()=>const BottomNavigationScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.w),
                  decoration: BoxDecoration(
                    color: MyColor.blackBoldColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Done", style: Constant.textDone),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterRow(int index, String text) {
    return GestureDetector(
      onTap: () {
        _selectFilter(index);
      },
      child: Obx(
            () => CustomFilter(
          text: text,
          icon: Icons.check,
          isSelected: _isSelected(index),
        ),
      ),
    );
  }

  bool _isSelected(int index) {
    switch (index) {
      case 0:
        return first.value;
      case 1:
        return second.value;
      case 2:
        return third.value;
      case 3:
        return fourth.value;
      case 4:
        return fifth.value;
      case 5:
        return six.value;
      default:
        return false;
    }
  }
}
