import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import 'package:movies/ui/forgot_password/forgot_password_screen.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/utils/app_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        Home.homeRoute: (context) => Home(),
       LoginScreen.routeName: (context)=> LoginScreen(),
        ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
      },
      theme: AppTheme.myTheme,
    );
  }
}
