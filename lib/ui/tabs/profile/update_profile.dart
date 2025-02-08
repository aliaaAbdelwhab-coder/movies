import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:movies/widget/text%20field%20widget.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = 'update_profile';
  const UpdateProfile({super.key});

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  int selectedAvatarIndex = -1;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> avatars = [
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

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Pick Avatar',
          style: AppStyles.regular16YellowRoboto,
        ),
        centerTitle: true,
        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     IconButton(
        //       icon: Icon(Icons.arrow_back, color: Colors.amber, size: 25),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //     SizedBox(width: 150),
        //     Text(
        //       'Pick Avatar',
        //       style: AppStyles.regular16YellowRoboto,
        //     ),

        //   ],
        // ),
      ),
      body:
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(

            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      height: height * 0.6,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: avatars.length,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedAvatarIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAvatarIndex = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.yellow,
                                  width: 3,
                                ),
                                color: isSelected ? Colors.yellow : Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(avatars[index]),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },

            child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.06),

              child: const CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage(AssetsManager.profileAvatar),
              ),
            ),
          ),),
          SizedBox(height: height * 0.06),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hintText: "John Safwat",
              prefixIcon: const Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextField(
              hintText: "0120000000",
              keyboard: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone, color: Colors.white),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Reset Password",
              style: AppStyles.regular15WhiteRoboto,
            ),
          ),

          SizedBox(height:height*0.15),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: "Delete Account",
                    backgroundColor: Colors.red,
                    borderColor: Colors.red,
                    textStyle: AppStyles.regular20WhiteRoboto,
                    onButtonClicked: () {},
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    text: "Update Data",
                    backgroundColor: Colors.amber,
                    borderColor: Colors.yellow,
                    onButtonClicked: () {},
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

