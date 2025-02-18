import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/ui/forgot_password/forgot_password_screen.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_bloc.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_repository.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_states.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart';

import '../../../utils/app_colors.dart';
import 'get_profile_model.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = "update_profile";
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UpdateProfileRepository updateProfileRepository = UpdateProfileRepository();
  String selectedAvatar = AssetsManager.profileAvatar;
  UpdateProfileBloc? viewModel;
  List<String> avatarList = [
    AssetsManager.Avatara0,
    AssetsManager.Avatar1,
    AssetsManager.Avatar2,
    AssetsManager.Avatar3,
    AssetsManager.Avatar4,
    AssetsManager.Avatar5,
    AssetsManager.Avatar6,
    AssetsManager.Avatar7,
    AssetsManager.Avatar8
  ];
  int selectedAvatarIndex = 0;
  bool _isInitial = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInitial) {
      final Data args = ModalRoute.of(context)!.settings.arguments as Data;
      viewModel = UpdateProfileBloc();
      viewModel?.nameController.text = args.name!;
      viewModel?.phoneController.text = args.phone!;
      selectedAvatarIndex = args.avaterId!;
      selectedAvatar = avatarList[selectedAvatarIndex];
      _isInitial = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Data args = ModalRoute.of(context)!.settings.arguments as Data;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<UpdateProfileBloc, UpdateProfileState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profile Updated Successfully!")));
        } else if (state is UpdateProfileErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is DeleteAccountSuccessState) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            AppLocalizations.of(context)!.pick_avatar,
            style: AppStyles.regular16YellowRoboto,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showAvatarPicker(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.06),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow.withOpacity(0.3),
                    ),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage(selectedAvatar),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                child: CustomTextField(
                  controller: viewModel?.nameController,
                  hintText: args.name,
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                ),
              ),
              SizedBox(height: height * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                child: CustomTextField(
                  controller: viewModel?.phoneController,
                  hintText: "0120000000",
                  keyboard: TextInputType.phone,
                  prefixIcon: Icon(Icons.phone, color: Colors.white),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.reset_password,
                    style: AppStyles.regular15WhiteRoboto,
                  ),
                ),
              ),
              SizedBox(height: height * 0.24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: AppLocalizations.of(context)!.delete_account,
                        backgroundColor: Colors.red,
                        borderColor: Colors.red,
                        textStyle: AppStyles.regular20WhiteRoboto,
                        onButtonClicked: () {
                          viewModel?.deleteAccount();
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: AppLocalizations.of(context)!.update_data,
                        backgroundColor: Colors.amber,
                        borderColor: Colors.yellow,
                        onButtonClicked: () {
                          viewModel?.updateProfile(selectedAvatarIndex);
                        },
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

  void _showAvatarPicker(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateBottomSheet) {
            return Container(
              padding: EdgeInsets.all(10),
              height: height * 0.6,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: avatarList.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedAvatarIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAvatarIndex = index;
                        selectedAvatar = avatarList[index];
                      });
                      setStateBottomSheet(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: width * 0.005,
                          color: AppColors.yellowColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: isSelected
                            ? Colors.yellow.withOpacity(0.6)
                            : Colors.transparent,
                      ),
                      padding: EdgeInsets.all(width * 0.02),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(avatarList[index]),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
