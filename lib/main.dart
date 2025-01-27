import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies/home.dart';

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
      },
    );
  }
}
