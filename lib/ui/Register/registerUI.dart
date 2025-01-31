import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/LocalizationToggleswitch.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Registerui extends StatefulWidget {
  static String registerRoute = "registerRoute";

  @override
  State<Registerui> createState() => _RegisteruiState();
}

class _RegisteruiState extends State<Registerui> {
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

  TextEditingController rePassController = TextEditingController();

  TextEditingController passController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  int selectedIndex = 0;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: avatarList.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  width: selectedIndex == itemIndex ? size.width * 0.4 : null,
                  child: Image.asset(
                    fit: selectedIndex == itemIndex ? BoxFit.contain : null,
                    avatarList[itemIndex],
                  ),
                ),
                options: CarouselOptions(
                  onPageChanged: (index, CarouselPageChangedReason) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  aspectRatio: 16 / 8,
                  enlargeStrategy: CenterPageEnlargeStrategy.values.first,
                  viewportFraction: 0.4,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  padEnds: true,
                ),
              ),
              SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          "Avatar",
                          style: AppStyles.regular16WhiteRoboto,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextField(
                          hintText: 'Name',
                          prefixIcon: Image.asset(AssetsManager.personIcon),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter name ";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextField(
                          hintText: 'Email',
                          prefixIcon: Image.asset(AssetsManager.emailIcon),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter email ";
                            }
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text);
                            if (!emailValid) {
                              return "please enter valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          prefixIcon: Image.asset(AssetsManager.passwordIcon),
                          suffixIcon: Image.asset(AssetsManager.eyeSlashIcon),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter Password ";
                            }
                            if (text.length < 6) {
                              return "password should be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextField(
                          hintText: 'Confirm Password',
                          prefixIcon: Image.asset(AssetsManager.passwordIcon),
                          suffixIcon: Image.asset(
                            AssetsManager.eyeSlashIcon,
                          ),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter password ";
                            }
                            if (text.length < 6) {
                              return "password should be at least 6 characters";
                            }
                            if (text != passController.text) {
                              return "re password dosnot match password";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomTextField(
                          hintText: 'Phone number',
                          prefixIcon: Image.asset(AssetsManager.phoneIcon),
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter Phone number ";
                            }
                            if (text.length != 11) {
                              return "Phone number should be 11 number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        CustomElevatedButton(
                          text: 'Create Account',
                          onButtonClicked: () {
                            Navigator.pushNamed(context, Home.homeRoute);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have Account ?  ",
                              style: AppStyles.regular14WhiteRoboto,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                "Login",
                                style: AppStyles.black14YellowRoboto,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        LocalizationToggleswitch(),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
