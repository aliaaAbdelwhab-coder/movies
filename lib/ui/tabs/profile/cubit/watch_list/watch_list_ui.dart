import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/home/movei_details/movie_details_view.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import '../logic/watch_list_logic.dart';

class WatchedMovieItem extends StatelessWidget {
  final int movieId;
  final String image;
  final num rating;

  WatchedMovieItem({required this.movieId, required this.image, required this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailsView(movieId: movieId)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  width: 120,
                  height: 180,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: AppColors.darkGreyColor),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(rating.toString(), style: AppStyles.regular16WhiteRoboto),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.amber, size: 14),
                      ],
                    ),
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
