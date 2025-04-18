import 'package:flutter/material.dart';

import '../globle/app_color/app_color_light.dart';

Widget mainButton({
  required Function() onpressed,
  required String text,
  double width=200.0,
  double height=50.0,
  Color backGroundColor=AppColorLight.buttonColor,
  Color textColor=Colors.white,
  double? fontSize=20,
  Widget? child,
})=>SizedBox(
  width: width,
  height: height,
  child: OutlinedButton(
    onPressed: onpressed,
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Colors.black,width: 2.0),
      backgroundColor: backGroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
    ),
    child: child??Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    ),
  ),
);

