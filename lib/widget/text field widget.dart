
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  int? maxLines;
  TextInputType? keyboard;
  String? Function(String?)? validator;
  TextEditingController? controller;

  CustomTextField(
      {super.key, this.borderColor,
        required this.hintText,
        this.labelText,
        this.hintStyle,
        this.labelStyle,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText = false,
        this.maxLines,
        this.validator,
        this.controller,
        this.keyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkGreyColor,
      ),
      child: TextFormField(
        style:AppStyles.regular15WhiteRoboto,
        keyboardType: keyboard,
        controller: controller,
        validator: validator,
        maxLines: maxLines ?? 1,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? AppStyles.regular16WhiteRoboto,
          labelText: labelText,
          labelStyle: labelStyle ?? AppStyles.regular15WhiteRoboto,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.darkGreyColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.darkGreyColor, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.redColor, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.redColor, width: 2)),
        ),
      ),
    );
  }
}