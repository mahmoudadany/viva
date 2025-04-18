import 'package:flutter/material.dart';

TextFormField checkOutTextField({
    required TextEditingController controller,
  String? label,
  required String hint,
  required TextInputType inputType,
  IconData? preFixIcon,
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
    // prefixIcon: Icon(preFixIcon),
    suffixIcon: suffixFixIcon,
  ),
  validator: validator,
  onChanged: onChange,
  onFieldSubmitted: onSubmitted,

);
