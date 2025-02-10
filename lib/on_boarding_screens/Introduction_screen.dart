import 'package:flutter/material.dart';
import 'package:movies/home.dart';
import '../../utils/assets_manager.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'on_boarding_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName = 'IntroductionScreen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Image.asset(
        AssetsManager.onBoarding1,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Spacer(),
      Positioned(
        bottom: height * .206,
        // left: width*.032,
        // right: width*.03,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Text(
            '    Find Your Next \nFavorite Movie Here',
            style: AppStyles.medium36WhiteInter,
          ),
        ),
      ),
      SizedBox(
        height: height * .02,
      ),
      Positioned(
        bottom: height * .1,
        left: width * .07,
        right: width * .07,
        child: Text(
          '\nGet access to a huge library of movies '
          'to suit all tastes. You will surely like it.',
          style: AppStyles.regular20WhiteInter,
        ),
      ),
      Spacer(),
      Positioned(
        width: width * .9,
        bottom: height * .015,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(OnBoardingScreen.routeName);
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: width * .04, vertical: height * .016),
                backgroundColor: AppColors.yellowColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: Text(
              AppLocalizations.of(context)!.exit,
              style: AppStyles.semiBold20BlackInter,
            )),
      ),
    ]));
  }
}
 