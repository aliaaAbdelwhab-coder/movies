import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../models/MovieResponse.dart';

class MovieItem extends StatelessWidget {
  final List<Movie> movies;

  MovieItem({required this.movies});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .65,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/onBoarding_image6.png',
            fit: BoxFit.fitWidth,
          ),
          Image.asset('assets/images/home.png'),
          CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder: (context, index, realId) {
              final movie = movies[index];
              return Container(
                margin: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: movie.largeCoverImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: AppColors.darkGreyColor,
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.black.withOpacity(8),
                                  Colors.transparent
                                ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            child: Text(
                              movie.title,
                              style: AppStyles.bold20WhiteRoboto,
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: height * .66,
              viewportFraction: 0.72,
              aspectRatio: 2,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
