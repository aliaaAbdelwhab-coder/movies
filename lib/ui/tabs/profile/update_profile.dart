import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_bloc.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_repository.dart';
import 'package:movies/ui/tabs/profile/cubit/update_profile_states.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = "update-profile";
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UpdateProfileRepository updateProfileRepository = UpdateProfileRepository();
  String selectedAvatar = AssetsManager.profileAvatar;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileBloc, UpdateProfileState>(
      
      listener: (context, state) {
        if (state is UpdateProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Updated Successfully!")));
        } else if (state is UpdateProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is DeleteAccountSuccessState) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Pick Avatar', style: AppStyles.regular16YellowRoboto),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () => _pickAvatar(context),
              child: CircleAvatar(radius: 75, backgroundImage: AssetImage(selectedAvatar)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CustomTextField(controller: nameController, hintText: "John Safwat"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: CustomTextField(controller: phoneController, hintText: "0120000000", keyboard: TextInputType.phone),
            ),
            CustomElevatedButton(text: "Delete Account", backgroundColor: Colors.red, onButtonClicked: () {
              context.read<UpdateProfileBloc>().deleteAccount("user_id");
            }),
            CustomElevatedButton(text: "Update Data", backgroundColor: Colors.amber, onButtonClicked: () {
              
            }),
          ],
        ),
      ),
    );
  }

  void _pickAvatar(BuildContext context) {
   
  }
} 