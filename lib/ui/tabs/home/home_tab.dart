import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,width: 200, height: 200,); // just testing to see if the tabs are properly displayed
  }
}
