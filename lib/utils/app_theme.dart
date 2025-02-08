import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData myTheme = ThemeData(
      primaryColor: AppColors.darkGreyColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGreyColor,
        selectedItemColor: AppColors.yellowColor,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.whiteColor,
      ),
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        iconTheme: const IconThemeData(
          color: AppColors.yellowColor,
          
        ),
        titleTextStyle: AppStyles.regular16YellowRoboto,
      )
      );
}
