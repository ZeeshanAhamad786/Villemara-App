import 'package:flutter/material.dart';

import 'constant.dart';
import 'my_color.dart';

Widget getHorizontalSpace (double width){
  return SizedBox(width: width,);
}
Widget getVerticalSpace (double height){
  return SizedBox(height: height,);
}


//


class CustomFilter extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;

  CustomFilter({required this.text, required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,style: Constant.textSearch,),

            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white
            ),
          ],
        ),
        Divider(color: Colors.grey),
      ],
    );
  }
}
