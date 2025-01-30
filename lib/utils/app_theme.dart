import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData myTheme = ThemeData(
      primaryColor: AppColors.darkGreyColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGreyColor,
        selectedItemColor: AppColors.yellowColor,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.whiteColor,
      ),
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(
          color: AppColors.yellowColor,
        ),
      )
      );
}
