import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/tabs/home/home_tab/movie_item.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

import 'cubit/movie_bloc_view_model.dart';
import 'cubit/movie_state.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  MovieBlocViewModel viewModel = MovieBlocViewModel();

  ApiManager apiManager = ApiManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.onGetMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBlocViewModel, MovieState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return Center(
            child: CircularProgressIndicator(
              color: AppColors.darkGreyColor,
            ),
          );
        } else if (state is MoviesSuccessState) {
          return MovieItem(movies: state.movies);
        } else if (state is MoviesErrorState) {
          return Center(
                child: Text(
                  state.errorMessage,
                  style: AppStyles.regular16WhiteRoboto,
                ),
              );
        }
        return Container();
      }),
    );
  }
}
