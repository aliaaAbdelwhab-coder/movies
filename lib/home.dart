import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/browse/browse_tab.dart';
import 'package:movies/ui/tabs/home/home_tab.dart';
import 'package:movies/ui/tabs/profile/profile_tab.dart';
import 'package:movies/ui/tabs/search/search_tab.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/assets_manager.dart';

class Home extends StatefulWidget {
  static String homeRoute = "homeRoute";
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      HomeTab(),
      SearchTab(),
      BrowseTab(),
      ProfileTab(),
    ];
    return Scaffold(
        bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: AppColors.darkGreyColor),
          //depends on what theme you're using currently,copywith so it only affect this scope
          child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                buildBottomNavigationBarItems(
                    index: 0,
                    iconUnselectedPath: AssetsManager.homeUnselectedIcon,
                    label: 'home',
                    iconSelectedPath: AssetsManager.homeSelectedIcon),
                buildBottomNavigationBarItems(
                    index: 1,
                    iconUnselectedPath: AssetsManager.searchUnselectedIcon,
                    label: 'search',
                    iconSelectedPath: AssetsManager.searchSelectedIcon),
                buildBottomNavigationBarItems(
                    index: 2,
                    iconUnselectedPath: AssetsManager.exploreUnselectedIcon,
                    label: 'explore',
                    iconSelectedPath: AssetsManager.exploreSelectedIcon),
                buildBottomNavigationBarItems(
                    index: 3,
                    iconUnselectedPath: AssetsManager.profileUnselectedIcon,
                    label: 'profile',
                    iconSelectedPath: AssetsManager.profileSelectedIcon),
              ]),
        ),
        body: tabs[selectedIndex]);
  }

  BottomNavigationBarItem buildBottomNavigationBarItems(
      {required int index,
      required String iconUnselectedPath,
      required String label,
      required String iconSelectedPath}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(
            selectedIndex == index ? iconSelectedPath : iconUnselectedPath)),
        label: label);
  }
}
