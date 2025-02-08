import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/assets_manager.dart';

class LocalizationToggleswitch extends StatefulWidget {
  const LocalizationToggleswitch({super.key});

  @override
  State<LocalizationToggleswitch> createState() => _LocalizationToggleswitchState();
}

class _LocalizationToggleswitchState extends State<LocalizationToggleswitch> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.23,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.yellowColor, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              isSelected = 0;
              setState(() {
              });              
            },
            child: CircleAvatar(
              backgroundColor: isSelected == 0 ? AppColors.yellowColor : AppColors.blackColor,
              child: Image.asset(AssetsManager.americaIcon),
            ),
          ),
          InkWell(
            onTap: () {
              isSelected = 1;
              setState(() {
              });
            },
            child: CircleAvatar(
              backgroundColor: isSelected == 1
                  ? AppColors.yellowColor
                  : AppColors.blackColor,
              child: Image.asset(AssetsManager.egyptIcon),
            ),
          ),
        ],
      ),
    );
  
  }
}
