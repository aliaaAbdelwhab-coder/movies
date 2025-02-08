import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/home/movie_details.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../models/MovieResponse.dart';

class MovieItem extends StatelessWidget {
  List<Movie> movies;

  MovieItem({
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(MovieDetails.movieRoute);
        print('Go To Movie Details');
      },
      child: Container(
        height: height * .6,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CarouselSlider.builder(
              itemCount: movies.length,
              itemBuilder: (context, index, realId) {
                final movie = movies[index];
                return Container(
                  //decoration: BoxDecoration(
                  // image: DecorationImage(image: movie.backgroundImage)),
                  height: height * .4,
                  margin: EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
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
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Text(movie.rating.toString(),
                                    style: AppStyles.regular16WhiteRoboto),
                                SizedBox(width: 4),
                                Icon(Icons.star, color: Colors.amber, size: 16),
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
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                    Colors.black.withOpacity(0.8),
                                    Colors.transparent
                                  ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                              child: Text(
                                movie.title,
                                style: AppStyles.bold20WhiteRoboto,
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: height * .6,
                viewportFraction: 0.72,
                aspectRatio: 2,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
