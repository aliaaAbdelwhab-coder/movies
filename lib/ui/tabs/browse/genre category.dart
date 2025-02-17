import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../utils/app_colors.dart';

class GenreCategory extends StatelessWidget {
  String genreName;
  bool isSelected;
  Color? borderColor;

  GenreCategory(
      {
        required this.genreName,
        required this.isSelected,
        this.borderColor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.005),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.yellowColor : AppColors.transparent,
          borderRadius: BorderRadius.circular(16),
          border:
          Border.all(color: borderColor ?? AppColors.yellowColor, width: 2)),
      child: Text(
        genreName,
        style: isSelected ? AppStyles.bold20BlockRoboto : AppStyles.bold20YellowRoboto,
      ),
    );
  }
}
