import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/home/movei_details/cubit/movie_details_state.dart';
import 'package:movies/ui/tabs/home/movei_details/cubit/movie_details_view_model.dart';

import '../../../../utils/app_colors.dart';

class MovieDetailsView extends StatefulWidget {
  //static const String movieRoute = "Movie Details";
  int movieId;

  // final String movieName;
  MovieDetailsView({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  late MovieDetailsViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = MovieDetailsViewModel(movieId: widget.movieId);
    viewModel.getMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is MoviesDetailsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.yellowColor,
              ),
            );
          } else if (state is MoviesDetailsSuccessState) {
            //final movie = state.movieDetails.movie;
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    color: Colors.orange,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 6,
                        right: 7,
                        child: Icon(
                          Icons.bookmark,
                          size: 25,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: state.movieDetails.movie!.backgroundImage ??
                            'No Image Found',
                        fit: BoxFit.fill,
                      ),
                      Text(state.movieDetails.movie!.title ?? ''),
                      Text(state.movieDetails.movie?.year.toString() ?? ''),
                    ],
                  )
                ],
              ),
            );
            //return MovieDetailsItem();
          } else if (state is MoviesDetailsErrorState) {
            return Container(
              color: Colors.red,
            );
            //   Center(
            //   child: Text(
            //     state.errorMessage,
            //     style: AppStyles.regular16WhiteRoboto,
            //   ),
            // );
          }
          return Container();
        });
  }
}

// todo: rating
// Positioned(
// top: 16,
// left: 16,
// child: Container(
// padding: EdgeInsets.symmetric(
// horizontal: 8, vertical: 4),
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.circular(12),
// ),
// child: Row(
// children: [
// Text(movie.rating.toString(),
// style: AppStyles.regular16WhiteRoboto),
// SizedBox(width: 4),
// Icon(Icons.star, color: Colors.amber, size: 16),
// ],
// ),
// ),
// ),
//todo: fav
// Positioned(
// top: 16,
// left: 16,
// child: Container(
// padding: EdgeInsets.symmetric(
// horizontal: 8, vertical: 4),
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.circular(12),
// ),
// child: Row(
// children: [
// Text(movie.rating.toString(),
// style: AppStyles.regular16WhiteRoboto),
// SizedBox(width: 4),
// Icon(Icons.favourite, color: Colors.amber, size: 16),
// ],
// ),
// ),
// ),
// todo: time
// Positioned(
// top: 16,
// left: 16,
// child: Container(
// padding: EdgeInsets.symmetric(
// horizontal: 8, vertical: 4),
// decoration: BoxDecoration(
// color: Colors.black54,
// borderRadius: BorderRadius.circular(12),
// ),
// child: Row(
// children: [
// Text(movie.rating.toString(),
// style: AppStyles.regular16WhiteRoboto),
// SizedBox(width: 4),
// Icon(Icons.clock, color: Colors.amber, size: 16),
// ],
// ),
// ),
// ),