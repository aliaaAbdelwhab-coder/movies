import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/tabs/home/movei_details/movie_details_view.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

class MovieItemWidget extends StatelessWidget {
  int movieId;
  String image;
  num rating;

  MovieItemWidget(
      {required this.movieId, required this.image, required this.rating});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsView(movieId: movieId
                    )));
        print('Go To Movie Details');
      },
      child: Container(
        width: 189,
        height: 279,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.darkGreyColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Align(
                alignment: Alignment.topLeft,
          
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:size.width*0.03, 
                  vertical:  size.height*0.015,
                  ),
                  width: size.width * 0.16,
                  height: size.height*0.035,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text(rating.toString(),
                          style: AppStyles.regular16WhiteRoboto),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
