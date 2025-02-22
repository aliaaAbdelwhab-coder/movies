import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/apiConstatnts.dart';
import 'package:movies/ui/tabs/home/movei_details/similar/cubit/similarViewModle.dart';
import 'package:movies/ui/tabs/home/movei_details/similar/cubit/states.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widget/MovieItemWidget.dart';

class Moviedetailssimilar extends StatefulWidget {
  int movieId;
  Moviedetailssimilar({required this.movieId});

  @override
  State<Moviedetailssimilar> createState() => _MoviedetailssimilarState();
}

class _MoviedetailssimilarState extends State<Moviedetailssimilar> {
  late Similarviewmodle viewModle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("=======================");
    print(widget.movieId);
    print("=======================");
    viewModle = Similarviewmodle(movieId: widget.movieId);

    viewModle.getMovieDetailsSimilar(Apiconstatnts.movieSuggestions);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<Similarviewmodle, SimilarState>(
        bloc: viewModle,
        builder: (context, state) {
          if (state is SimilarLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellowColor,
              ),
            );
          } else if (state is SimilarErrorState) {
            return Center(
              child: Text(
                "No similar movies",
                style: AppStyles.regular20WhiteInter,
              )
            );
          } else if (state is SimilarSuccessState && state.movies.isNotEmpty) {
            return Wrap(
              spacing:size.width*0.03  , // Horizontal space between items
              runSpacing: size.height*0.02,  // Vertical space between lines             
                children: state.movies.map((movie) {
                  return MovieItemWidget(
                      movieId: movie.id!,
                  image: movie.mediumCoverImage!,
                  rating: movie.rating ?? 0.0);
            }).toList());
          }
          return Text(
            "no similar movies",
            style: AppStyles.regular20WhiteInter,
          );
        });
  }
}
