import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/MovieDetailsResponse.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsItem extends StatelessWidget {
  MovieDetails movieDetails;

  MovieDetailsItem({required this.movieDetails});
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(movieDetails.movie!.url!);
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: movieDetails.movie!.largeCoverImage ?? 'No Image Found',
          fit: BoxFit.fill,
        ),
        Container(
          width: size.width,
          height: size.height * 0.8,
          decoration: BoxDecoration(
            color: const Color.fromARGB(108, 16, 16, 16),
          ),
        ),
        Container(
          
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Image.asset(AssetsManager.saveIcon),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.31,
              ),
              Center(child: Image.asset(AssetsManager.watchIcon)),
              SizedBox(
                height: size.height * 0.11,
              ),
              Text(
                movieDetails.movie!.title!,
                style: AppStyles.bold24WhiteRoboto,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "${movieDetails.movie!.year!}",
                style: AppStyles.bold20GreyRoboto,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.watch,
                onButtonClicked: ()async {
                  try {
                    launchUrl(url, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    print(
                        "$e ===============this is url error===================");
                  }
                },
                textStyle: AppStyles.bold20WhiteRoboto,
                backgroundColor: AppColors.redColor,
                borderColor: AppColors.redColor,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContaner(
                    Imageicon: AssetsManager.favoriteIcon,
                    text: " ${movieDetails.movie!.likeCount!}",
                  ),
                  CustomContaner(
                    Imageicon: AssetsManager.timeIcon,
                    text: " ${movieDetails.movie!.runtime!}",
                  ),
                  CustomContaner(
                    Imageicon: AssetsManager.starIocn,
                    text: " ${movieDetails.movie!.rating!}",
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class CustomContaner extends StatelessWidget {
  String text;
  String Imageicon;
  CustomContaner({required this.text, required this.Imageicon});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.3,
        height: size.height * 0.055,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.01),
        decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(Imageicon),
            Text(
              text,
              style: AppStyles.bold24WhiteRoboto,
            )
          ],
        ));
  }
}
