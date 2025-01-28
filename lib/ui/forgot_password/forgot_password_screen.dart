import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgot_password_screen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password', style: AppStyles.regular16YellowRoboto),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            children: [
              Image.asset(
                AssetsManager.forgotPasswordImage,
                fit: BoxFit.fill,
                width: width,
                height: height * 0.46,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Form(
                key: formKey,
                child: CustomTextField(
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
                    hintText: 'Email'),
              ),
              SizedBox(height: height * 0.02),
              CustomElevatedButton(
                  onButtonClicked: verifyEmail, text: 'Verify Email'),
            ],
          ),
        ),
      ),
    );
  }

  void verifyEmail() {
    if (formKey.currentState?.validate() == true) {
      // todo: verify Email
    }
  }
}
