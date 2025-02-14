import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

class Moviedetailsgenres extends StatelessWidget {
  List<String> genres;
  Moviedetailsgenres({required this.genres});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return Wrap(
      spacing:size.width*0.02  , // Horizontal space between items
      runSpacing: size.height*0.02, // Vertical space between lines
      children: genres.map((genre) {
        return Container(
          width: size.width*0.3,
          height: size.height*0.05,
          child: Center(
            child: Text(
              genre,
              style: AppStyles.regular16WhiteRoboto,
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(12)
          ),
        
          
        );
      }).toList(),
    );
  }
}
