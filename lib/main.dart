import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import 'package:movies/ui/tabs/browse/browse_tab.dart';
import 'package:movies/ui/forgot_password/forgot_password_screen.dart';
import 'package:movies/ui/tabs/home/home_tab.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/ui/tabs/profile/profile_tab.dart';
import 'package:movies/ui/tabs/profile/update_profile.dart';
import 'package:movies/ui/tabs/search/search_tab.dart';
import 'package:movies/utils/app_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.homeRoute,
      routes: {
        Home.homeRoute: (context) => Home(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
        HomeTab.routeName: (context) => HomeTab(),
        ProfileTab.routeName: (context) => ProfileTab(),
        SearchTab.routeName: (context) => SearchTab(),
        BrowseTab.routeName: (context) => BrowseTab(),
        UpdateProfile.routeName : (context) => UpdateProfile(),
      },
      theme: AppTheme.myTheme,
    );
  }
}
