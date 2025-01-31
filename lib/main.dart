import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import 'package:movies/utils/app_theme.dart';

import 'on_boarding_screens/Introduction_screen.dart';
import 'on_boarding_screens/on_boarding_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.myTheme,
      initialRoute: IntroductionScreen.routeName,
      routes: {
        IntroductionScreen.routeName: (context) => IntroductionScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        Home.homeRoute: (context) => Home(),
      },
    );
  }
}
