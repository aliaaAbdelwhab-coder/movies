import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  static const String routeName = 'profile_screen';

  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.purple,width: 200, height: 200,); // just testing to see if the tabs are properly displayed
  }
}
