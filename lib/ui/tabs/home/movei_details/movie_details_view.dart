import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/home/movei_details/cast%20widget.dart';
import 'package:movies/ui/tabs/home/movei_details/cubit/movie_details_state.dart';
import 'package:movies/ui/tabs/home/movei_details/cubit/movie_details_view_model.dart';
import 'package:movies/ui/tabs/home/movei_details/movieDetailsGenres.dart';
import 'package:movies/ui/tabs/home/movei_details/movie_details_item.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  late MovieDetailsViewModel viewModel = MovieDetailsViewModel(movieId: widget.movieId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("=================================================");
    print(widget.movieId);
    print("========================================");



    viewModel.getMovieDetails();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
              body:CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: MovieDetailsItem(movieDetails: state.movieDetails),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                   padding: EdgeInsets.only(left: 12, bottom: 0),
                      child: Text('Cast',style: AppStyles.bold24WhiteInter,),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CastWidget(
                          castList: state.movieDetails.movie!.cast
                      ),
                    ) ,
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.03 ),
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.genres , style: AppStyles.bold24WhiteRoboto,),
                        SizedBox(height: height*0.01,),
                        Moviedetailsgenres(genres:state.movieDetails.movie!.genres!),
                          SizedBox(height: height*0.03,),
                      ],
                    ),
                  ) ,
                )  
                ],
              ),

            );
            //return MovieDetailsItem();
          } else if (state is MoviesDetailsErrorState) {
            return
              Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.regular16WhiteRoboto,
              ),
            );
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