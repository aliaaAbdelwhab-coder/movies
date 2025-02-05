import 'package:flutter/material.dart';

import '../../data/models/movie.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key, required this.height, required this.width, this.radius, required this.movie});
  final double height;
  final double width;
  final double? radius;
  final Movie movie;
  

  @override
  Widget build(BuildContext context) {
    return Container(
       height: height,
       width: width,
       decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(movie.url ??'')),
        borderRadius: BorderRadius.circular(
        radius ?? 20
        )
       )
       ,
       child: Column(children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF121312B5).withValues(alpha: 0.71) ,
                
              ),
              height: 28,
              width: 58,
              
            )
          ],
        )
       ],),

    );
  }
}