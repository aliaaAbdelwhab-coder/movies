import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies/Register/registerUI.dart';
import 'package:movies/home.dart';
import 'package:movies/utils/app_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registerui(),
      routes: {
        Home.homeRoute: (context) => Home(),
      Registerui.registerRoute  :(context)=>Home(),
      },
      theme: AppTheme.myTheme,
    );
    
  }
}
