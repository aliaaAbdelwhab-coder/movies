import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/MovieDetailsResponse.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

class CastWidget extends StatelessWidget {
  final List<Cast>? castList;

  CastWidget({required this.castList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return castList == null || castList!.isEmpty
        ? Center(
            child: Text("No cast available",
                style: TextStyle(color: Colors.white)))
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: castList!.length,
            itemBuilder: (context, index) {
              var castMember = castList![index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  decoration: BoxDecoration(
                    color: AppColors.darkGreyColor, // Dark background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: castMember.urlSmallImage?.isNotEmpty == true
                              ? castMember.urlSmallImage!
                              : 'https://via.placeholder.com/70', // Fallback placeholder
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${castMember.name ?? 'Unknown'}',
                                style: AppStyles.regular20WhiteRoboto,
                                overflow:
                                    TextOverflow.ellipsis, // Prevents overflow
                                maxLines: 1,
                              ),
                              Text(
                                'Character : ${castMember.characterName ?? 'Unknown Role'}',
                                style: AppStyles.regular20WhiteRoboto,
                                overflow:
                                    TextOverflow.ellipsis, // Prevents overflow
                                maxLines: 2,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              );
            });
  }
}
