import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart'; 

class UpdateProfile extends StatelessWidget {
  static const String routeName = 'update_profile';
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.amber, size: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 150),
            Text(
              'Pick Avatar',
              style: AppStyles.regular16YellowRoboto,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center( 
            child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.06),
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(AssetsManager.profileAvatar),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), 
            child: CustomTextField(
              hintText: "John Safwat",
              prefixIcon: Icon(Icons.person, color: Colors.white), 
            ),
          ),
          SizedBox(height: 15), 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), 
            child: CustomTextField(
              hintText: "0120000000",
              keyboard: TextInputType.phone,
              prefixIcon: Icon(Icons.phone, color: Colors.white), 
            ),
          ),
          SizedBox(height: 25), 
          Padding(
            padding: EdgeInsets.only(left: 15), 
            child: Text(
              "Reset Password",
              style: AppStyles.regular15WhiteRoboto,
            ),
          ),
          SizedBox(height: 70), 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity, 
                  child: CustomElevatedButton(
                    text: "Delete Account",
                    backgroundColor: Colors.red,
                    borderColor: Colors.red,
                    textStyle: AppStyles.regular20WhiteRoboto,
                    onButtonClicked: () {
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity, 
                  child: CustomElevatedButton(
                    text: "Update Data",
                    backgroundColor: Colors.amber,
                    borderColor: Colors.yellow,
                    onButtonClicked: () {
                     
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


