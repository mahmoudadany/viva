import 'package:flutter/material.dart';

Widget onBoardingButton({
  required Function() onPressed,
  required String title,
})=> OutlinedButton(
  onPressed: onPressed,
  style: OutlinedButton.styleFrom(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 40.0,vertical: 15.0),
    backgroundColor: Color(0xb8ffffff),
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  ),
  child: Text(
    title,
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);

Text authPageText({
  required String text,
  TextStyle? style,
})=>Text(
  text,
  style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  ),
);

TextFormField authTextField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required TextInputType inputType,
  required IconData preFixIcon,
  Widget? suffixFixIcon,
  bool isPassword=false,
  InputDecoration? decoration,
  Function(String value)? onChange,
  Function(String value)? onSubmitted,
  String? Function(String? value)? validator,
})=> TextFormField(
  controller: controller,
  keyboardType: inputType,
  obscureText: isPassword,
  decoration: decoration ?? InputDecoration(
    labelText: label,
    hintText: hint,
    prefixIcon: Icon(preFixIcon),
    suffixIcon: suffixFixIcon,
  ),
  validator: validator,
  onChanged: onChange,
  onFieldSubmitted: onSubmitted,

);
