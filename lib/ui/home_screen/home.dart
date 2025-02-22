import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/browse/browse_tab.dart';
import 'package:movies/ui/tabs/home/home_tab/home_tab.dart';
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
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: AppColors.darkGreyColor),
          child: Container(
            margin: EdgeInsets.all(width * 0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  currentIndex: selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
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
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
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
