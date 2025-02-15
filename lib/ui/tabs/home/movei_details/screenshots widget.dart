import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScreenShotsWidget extends StatelessWidget {
   String image1;
   String image2;
   String image3;

   ScreenShotsWidget({
    required this.image1,
    required this.image2,
    required this.image3,
  }) ;

@override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageContainer(image1),
         SizedBox(height: 10),
        _buildImageContainer(image2),
         SizedBox(height: 10),
        _buildImageContainer(image3),
      ],
    );
  }

  Widget _buildImageContainer(String imageUrl) {

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), 
        border: Border.all(color: Colors.white, width: 2), 
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16), 
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
               Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
             Icon(Icons.error, color: Colors.red),
        ),
      ),
    );
  }
}





