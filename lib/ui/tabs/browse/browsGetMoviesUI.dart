import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/browse/cubit/browseGetMoviesStates.dart';
import 'package:movies/ui/tabs/browse/cubit/browseGetMoviesViewModle.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widget/MovieItemWidget.dart';

class Browsgetmoviesui extends StatelessWidget {
  
  String genre;
  Browsgetmoviesui({required this.genre});
  BrowseGetMoviesviewmodle viewModle = BrowseGetMoviesviewmodle();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder(
        bloc: viewModle..getBrowsMovies(genre),
        builder: (context, state) {
          if (state is BrowseMoviesLoadingState) {
            return Center(
              child: const CircularProgressIndicator(
                color: AppColors.darkGreyColor,
              ),
            );
          } else if (state is BrowsMoviesErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppStyles.regular16WhiteRoboto,
              ),
            );
          } else if (state is BrowseMoviesSuccessState) {
            return GridView.builder(
              
              itemCount : state.movies.length ,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: size.height*0.01,
                  crossAxisSpacing :size.width*0.05,
                  childAspectRatio: 0.7,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return MovieItemWidget(
                      movieId: state.movies[index].id!,
                      image: state.movies[index].mediumCoverImage ??'',
                      rating: state.movies[index].rating ?? 0
                      );
                });
          }
          return Container();
        });
  }
}
