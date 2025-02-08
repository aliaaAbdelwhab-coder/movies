import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? backgroundColor;
  Color? borderColor;
  TextStyle? textStyle;
  Function onButtonClicked;

  CustomElevatedButton(
      {super.key, required this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.backgroundColor,
      this.borderColor,
      this.textStyle,
      
      required this.onButtonClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.yellowColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                    color: borderColor ?? AppColors.yellowColor, width: 1)),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.02)),
        onPressed: () {
          onButtonClicked();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            suffixIcon ?? const SizedBox(),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              text,
              style: textStyle ?? AppStyles.regular20BlackRoboto,
            )
          ],
        ));
  }
}
