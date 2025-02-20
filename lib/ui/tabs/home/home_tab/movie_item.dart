import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/models/movie_response.dart';
import 'package:movies/ui/tabs/home/movei_details/movie_details_view.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

class MovieItem extends StatefulWidget {
  List<MoviesData> movies;

  MovieItem({required this.movies});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * .65,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                // Background image depending on the current movie in the carousel
                CachedNetworkImage(
                  imageUrl: widget.movies.isNotEmpty
                      ? widget.movies[currentIndex].largeCoverImage ?? ''
                      : '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.darkGreyColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),

                Image.asset(
                  'assets/images/home_bg.png',
                  fit: BoxFit.fill,
                ),

                // Carousel Slider
                CarouselSlider.builder(
                  itemCount: widget.movies.length,
                  itemBuilder: (context, index, realId) {
                    var movie = widget.movies[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsView(
                              movieId: movie.id!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: height * .4,
                        margin: EdgeInsets.all(width * 0.02),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: movie.largeCoverImage ?? '',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.darkGreyColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              Positioned(
                                top: height * 0.017,
                                left: height * 0.017,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.002),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(movie.rating.toString(),
                                          style:
                                              AppStyles.regular16WhiteRoboto),
                                      SizedBox(width: width * 0.02),
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.all(width * 0.02),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Text(
                                    movie.title!,
                                    style: AppStyles.bold20WhiteRoboto,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: height * .5,
                    viewportFraction: 0.72,
                    aspectRatio: 2,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex =
                            index; // Update background when movie changes
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.blackColor,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.action,
                        style: AppStyles.regular20WhiteRoboto),
                    Row(
                      children: [
                        Text(AppLocalizations.of(context)!.see_more,
                            style: AppStyles.regular16YellowRoboto),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.yellowColor,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
                // ListView.builder(itemBuilder: (context, index) {
                //   return MovieItem(movies: 'null');
                // },)
              ],
            ),
          )
        ],
      ),
    );
  }
}
