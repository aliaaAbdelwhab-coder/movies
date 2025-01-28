import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';

class Registerui extends StatelessWidget {
  List<String> avatarList = [
    AssetsManager.Avatara0,
    AssetsManager.Avatar1,
    AssetsManager.Avatar2,
    AssetsManager.Avatar3,
    AssetsManager.Avatar4,
    AssetsManager.Avatar5,
    AssetsManager.Avatar6,
    AssetsManager.Avatar7,
    AssetsManager.Avatar8,
  ];
  static String registerRoute = "registerRoute";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
        ),
        centerTitle: true,
      ),
      body: CarouselSlider.builder(
        itemCount: avatarList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            InkWell(
          child: Image.asset(
            avatarList[itemIndex],
            width: size.width * 0.3,
            height: size.height * 0.4,
          ),
          onTap: () {
            // save selected avatar 
          },
        ),
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 0.3,
          padEnds: true,
        ),
      ),
    );
  }
}
