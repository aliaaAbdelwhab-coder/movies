import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/forgot_password/cubit/forgot_password_states.dart';
import 'package:movies/ui/forgot_password/cubit/forgot_password_view_model.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/dialogUtils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgot_password_screen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordViewModel viewModel = ForgotPasswordViewModel();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<ForgotPasswordViewModel, ForgotPasswordStates>(
      listener: (context, state) {
        if (state is LoadingForgotPasswordState) {
          Dialogutils.showLoading(context: context, messsage: "Loading...");
        } else if (state is ErrorForgotPasswordState) {
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
            context: context,
            message: state.errorMessage,
            title: "Error",
            posActionsName: "OK",
          );
        } else if (state is SuccessForgotPasswordState) {
          Dialogutils.hideLoading(context: context);
          Dialogutils.showMessage(
              context: context,
              message: state.SuccessMessage,
              title: "success",
              posActionsName: "OK",
              posAcitons: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              });
        }
      },
      bloc: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Forget Password', style: AppStyles.regular16YellowRoboto),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child:
            Column(
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
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: viewModel.oldPasswordController,
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
                          hintText: AppLocalizations.of(context)!.old_password),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                          controller: viewModel.newPasswordController,
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
                          hintText: AppLocalizations.of(context)!.new_password),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                CustomElevatedButton(
                    onButtonClicked: () {
                      viewModel.resetPassword();
                    },
                    text: 'Verify Email'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
