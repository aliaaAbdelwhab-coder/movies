import 'package:flutter/material.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';

class ProfileTab extends StatelessWidget {
  static const String routeName = 'profile_Tab';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.02, horizontal: width * 0.0558),
                color: AppColors.darkGreyColor,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage(AssetsManager.profileAvatar),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                "John Safwat",
                                style: AppStyles.bold20WhiteRoboto,
                              ),
                            ],
                          ),
                          SizedBox(width: width * 0.1),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "12",
                                    style: AppStyles.bold36WhiteRoboto,
                                  ),
                                  Text(
                                    "Wish List",
                                    style: AppStyles.bold24WhiteRoboto,
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    "10",
                                    style: AppStyles.bold36WhiteRoboto,
                                  ),
                                  Text(
                                    "History",
                                    style: AppStyles.bold24WhiteRoboto,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 2,
                            child: CustomElevatedButton(
                                text: 'Edit Profile',
                                onButtonClicked: () {
                                  // todo: navigate to update profile screen
                                },
                                textStyle: AppStyles.regular20BlackRoboto)),
                        SizedBox(
                          width: width * 0.035,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomElevatedButton(
                              text: 'Exit',
                              onButtonClicked: () {
                                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                              },
                              backgroundColor: AppColors.redColor,
                              textStyle: AppStyles.regular20WhiteRoboto,
                              borderColor: Colors.transparent,
                              suffixIcon: Icon(
                                Icons.logout,
                                color: AppColors.whiteColor,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: AppColors.darkGreyColor,
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorColor: AppColors.yellowColor,
                        labelColor: AppColors.yellowColor,
                        unselectedLabelColor: AppColors.whiteColor,
                        tabs: [
                          Tab(
                            icon: ImageIcon(
                                AssetImage(AssetsManager.watchListIcon)),
                            text: "Watch List",
                          ),
                          Tab(
                            icon: ImageIcon(
                              AssetImage(AssetsManager.historyIcon),
                              color: AppColors.yellowColor,
                            ),
                            text: "History",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.5,
                      child: TabBarView(
                        children: [
                          // Watch List Content
                          Center(
                            child: Image.asset(
                              AssetsManager.popCorn,
                              width: 100,
                            ),
                          ),

                          Center(
                            child: Text(
                              "No history available",
                              style: AppStyles.regular16WhiteRoboto,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
