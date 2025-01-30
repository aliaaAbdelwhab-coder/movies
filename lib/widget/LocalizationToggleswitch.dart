import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LocalizationToggleswitch extends StatelessWidget {
  const LocalizationToggleswitch({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ToggleSwitch(
      borderColor: [AppColors.yellowColor],
      borderWidth: 2,
      customWidths: [size.width * 0.15, size.width * 0.15],
      // activeBorders: [Border.symmetric(horizontal:BorderSide(width: 5) ,vertical: BorderSide(width: 10) )],
      cornerRadius: 20.0,
      activeBgColors: [
        [AppColors.yellowColor],
        [AppColors.yellowColor]
      ],

      // activeFgColor: Colors.white,
      inactiveBgColor: Colors.transparent,
      // inactiveFgColor: Colors.white,
      initialLabelIndex: 0,
      totalSwitches: 2,
      customWidgets: [
        Image.asset(AssetsManager.americaIcon),
        Image.asset(AssetsManager.egyptIcon),
      ],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}
