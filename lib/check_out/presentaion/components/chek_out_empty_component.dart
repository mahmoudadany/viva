import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget checkOutEmpty(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:
    [
      SizedBox(
        height: 200,
        child: SvgPicture.asset('assets/images/cart_empty.svg'),
      ),
      const SizedBox(height: 10.0,),
      Text(
        "cartEmpty".tr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
    ],
  );
}