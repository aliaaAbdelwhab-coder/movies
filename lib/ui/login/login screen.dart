import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/forgot_password/forgot_password_screen.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/assets_manager.dart';
import '../../widget/button widget.dart';
import '../../widget/text field widget.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.04),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AssetsManager.logo,
                  height: height * 0.25,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                    keyboard: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter email';
                      }
                      final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'please enter a valid email';
                      }
                      return null;
                    },
                    prefixIcon: Image.asset(AssetsManager.emailIcon),
                    hintText:'Email'),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                    keyboard: TextInputType.number,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter your password';
                      }
                      if (text.length < 6) {
                        return 'password should be at least 6 chars';
                      }
                      return null;
                    },
                    obscureText: true,
                    suffixIcon: Image.asset(AssetsManager.eyeSlashIcon),
                    prefixIcon: Image.asset(AssetsManager.passwordIcon),
                    hintText: 'password'),
                SizedBox(
                  height: height * 0.01,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'forget_password',
                        style: AppStyles.regular14YellowRoboto
                      ),
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomElevatedButton(
                    onButtonClicked: login,
                    text: 'Login'),
                SizedBox(
                  height: height * 0.02,
                ),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: 'Don\'t Have Account? ',
                          style: AppStyles.regular14WhiteRoboto),
                      TextSpan(
                          text: 'create one',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {},
                          style: AppStyles.regular14YellowRoboto
                      )
                    ])),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.yellowColor,
                        thickness: 2,
                        endIndent: 20,
                        indent: 60,
                      ),
                    ),
                    Text(
                    'OR',
                      style: AppStyles.regular15YellowRoboto,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.yellowColor,
                        thickness: 2,
                        endIndent: 60,
                        indent: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomElevatedButton(
                    onButtonClicked: () {
                      //login with google
                    },
                    textStyle: AppStyles.regular16greyRoboto,
                    prefixIcon: Image.asset(AssetsManager.googleIcon),
                    text: ' Login With Google'),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: Container(
                    width: width*0.240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.yellowColor,
                        width: 2
                      )
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(AssetsManager.americaIcon),
                          backgroundColor: AppColors.yellowColor,
                        ),
                        SizedBox(width: width*0.03,),
                        CircleAvatar(
                          backgroundColor: AppColors.blackColor,
                          child: Image.asset(AssetsManager.egyptIcon),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {

    if (formKey.currentState?.validate() == true) {
      //login

      }
    }
}