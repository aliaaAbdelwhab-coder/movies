import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Register/registerUI.dart';
import 'package:movies/home.dart';
import 'package:movies/ui/forgot_password/forgot_password_screen.dart';
import 'package:movies/ui/login/cubit/login%20states.dart';
import 'package:movies/ui/login/cubit/login%20view%20model.dart';
import 'package:movies/widget/LocalizationToggleswitch.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/assets_manager.dart';
import '../../utils/dialogUtils.dart';
import '../../widget/button widget.dart';
import '../../widget/text field widget.dart';
import 'google sign in api.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
LoginViewModel viewModel=LoginViewModel();



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<LoginViewModel,LoginStates>(
      bloc: viewModel,
      listener: (context,state){
        if(state is LoadingLoginState){
          Dialogutils.showLoading(context: context, messsage: "Loading...");
        }else if(state is ErrorLoginState){
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
            context: context,
            message: state.errorMessage,
            title: "Error",
            posActionsName: "OK",
          );
        }else if(state is SuccessLoginState){
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
              context: context,
              message: state.SuccessMessage,
              title: "success",
              posActionsName: "OK",
              posAcitons: (){Navigator.pushReplacementNamed(context, Home.homeRoute);}
          );
        }

      },

      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.04),
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
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
                    controller: viewModel.emailController,
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
                      hintText: AppLocalizations.of(context)!.email),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextField(
                    controller: viewModel.passwordController,
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
                      hintText: AppLocalizations.of(context)!.password),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, ForgotPasswordScreen.routeName);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(AppLocalizations.of(context)!.forget +AppLocalizations.of(context)!.password ,
                            style: AppStyles.regular14YellowRoboto),
                      )),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomElevatedButton(onButtonClicked:(){
                    viewModel.login();
                  },
                      text: AppLocalizations.of(context)!.login ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                            text: AppLocalizations.of(context)!.dont_have_account + ' ? ' ,
                            style: AppStyles.regular14WhiteRoboto),
                        TextSpan(
                            text: AppLocalizations.of(context)!.create_one ,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, Registerui.registerRoute);
                              },
                            style: AppStyles.regular14YellowRoboto)
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
                      onButtonClicked: signIn,
                      textStyle: AppStyles.regular16greyRoboto,
                      prefixIcon: Image.asset(AssetsManager.googleIcon),
                      text: AppLocalizations.of(context)!.login_with_google ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Center(child: LocalizationToggleswitch()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



Future  signIn()async {
  await GoogleSignInApi.login();
  }

}
