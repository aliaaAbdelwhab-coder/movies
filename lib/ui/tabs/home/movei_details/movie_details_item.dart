import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/models/MovieDetailsResponse.dart';
import 'package:movies/ui/tabs/profile/watchList/cubit/WatchListViewModle.dart';
import 'package:movies/ui/tabs/profile/watchList/cubit/watchListStates.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/assets_manager.dart';
import 'package:movies/utils/dialogUtils.dart';
import 'package:movies/widget/button%20widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/widget/sheardPrefrences.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsItem extends StatelessWidget {
  MovieDetails movieDetails;

  MovieDetailsItem({required this.movieDetails});
  Watchlistviewmodle watchlistviewmodle = Watchlistviewmodle();
  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(movieDetails.movie!.url!);
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CachedNetworkImage(
          // fit: BoxFit.fill,
          imageUrl: movieDetails.movie!.largeCoverImage?.isNotEmpty == true
              ? movieDetails.movie!.largeCoverImage!
              : 'https://via.placeholder.com/70', // Fallback placeholder
          // width: width *0.1,
          // height: height *.1,
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              Center(child: Icon(Icons.error, color: Colors.red)),
          //===========================
          // imageUrl: movieDetails.movie!.largeCoverImage ?? '',
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
              // SizedBox(
              //   // height: size.height * 0.005,
              // ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.045,
                    vertical: size.height * 0.015,
                  ),
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
                      InkWell(
                        onTap: () {
                          watchlistviewmodle.addWatchList(
                              movieId: "${movieDetails.movie!.id}",
                              name: movieDetails.movie!.title!,
                              rating: movieDetails.movie!.rating!,
                              imageURL: movieDetails.movie!.mediumCoverImage!,
                              year: "${movieDetails.movie!.year}");
                        },
                        child:
                            // Image.asset(AssetsManager.saveIcon),
                            BlocBuilder<Watchlistviewmodle, Watchliststates>(
                                bloc: watchlistviewmodle,
                                builder: (context, state) {
                                  if (state is SuccessWatchliststate) {
                                    return Image.asset(
                                      AssetsManager.saveIcon,
                                      color: AppColors.yellowColor,
                                    );
                                  } else if (state is ErrorWatchliststate) {
                                    print("${state.errorMessage} ================================================");
                                    // Dialogutils.showMessage(
                                    //     context: context,
                                    //     message: state.errorMessage[0]);
                                    return Image.asset(AssetsManager.saveIcon);
                                  }
                                  return Image.asset(AssetsManager.saveIcon);
                                }),
                      ),
                    ],
                  ),
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
                onButtonClicked: () async {
                  SharedPreferenceUtils.saveData(key:"${movieDetails.movie!.id}" , value: [
                    movieDetails.movie!.id.toString() ,
                    movieDetails.movie!.rating.toString(),
                    movieDetails.movie!.mediumCoverImage.toString(), 
                  ]);
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
