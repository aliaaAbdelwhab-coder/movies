import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/ui/tabs/home/home_tab/cubit/get_all_movies_view_model.dart';
import 'package:movies/ui/tabs/home/home_tab/movie_item.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widget/MovieItemWidget.dart';

import 'cubit/movie_bloc_view_model.dart';
import 'cubit/movie_state.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Horror',
    'Biography',
    'Animation',
    'Family',
    'Documentary',
    'Sci-Fi',
    'Adventure',
    "Crime",
    'Fantasy',
    'History',
    'Thriller'
  ];

  Random random = new Random();
  int randomNumber = 0;

  @override
  void initState() {
    super.initState();
    randomNumber = random.nextInt(14);
  }

  // void handleTabChange() {
  //   if (tabController.indexIsChanging) {
  //     String genre;
  //     final List<String> genres = [
  //       'Action', 'Drama', 'Comedy', 'Horror', 'Biography',
  //       'Animation', 'Family', 'Documentary', 'Sci-Fi',
  //       'Adventure', "Crime", 'Fantasy', 'History', 'Thriller'];
  //     // switch (tabController.index) {
  //     // case 0:
  //     // genre = 'Action';
  //     // break;
  //     // case 1:
  //     // genre = 'Drama';
  //     // break;
  //     //   case 2:
  //     //     genre = 'Adventure';
  //     //     break;
  //     //   case 3:
  //     //     genre = "Crime";
  //     //     break;
  //     //   case 4:
  //     //     genre = 'Fantasy';
  //     //     break;
  //     //   case 5:
  //     //     genre = 'History';
  //     //     break;
  //     //   case 6:
  //     //     genre = 'Thriller';
  //     //     break;
  //     //   case 7:
  //     //     genre = 'Horror';
  //     //     break;
  //     //   case 8:
  //     //     genre = 'Biography';
  //     //     break;
  //     //   case 9:
  //     //     genre = 'Comedy';
  //     //     break;
  //     //   case 10:
  //     //     genre = 'Animation';
  //     //     break;
  //     //   case 11:
  //     //     genre = 'Family';
  //     //     break;
  //     //   case 12:
  //     //     genre = 'Documentary';
  //     //     break;
  //     //   case 13:
  //     //     genre = 'Sci-Fi';
  //     //     break;
  //     // default:
  //     // genre = 'Comedy';
  //     // }
  //     // context.read<GetAllMoviesViewModel>().updateGenre(genre);
  //     // }
  //   }
  // }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieBlocViewModel()..onGetMovies()),
        BlocProvider(
            create: (context) =>
                GetAllMoviesViewModel()..getAllMovies(genres[randomNumber]))
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<MovieBlocViewModel, HomeTabState>(
                  builder: (context, state) {
                if (state is HomeMoviesLoadingState) {
                  return Center(
                    child: const CircularProgressIndicator(
                      color: AppColors.darkGreyColor,
                    ),
                  );
                } else if (state is HomeMoviesSuccessState) {
                  return MovieItem(movies: state.movies);
                } else if (state is HomeMoviesErrorState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppStyles.regular16WhiteRoboto,
                    ),
                  );
                }

                return Container();
              }),
              BlocBuilder<GetAllMoviesViewModel, HomeTabState>(
                  builder: (context, state) {
                if (state is GetAllMoviesLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  );
                }
                if (state is GetAllMoviesErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                if (state is GetAllMoviesSuccessState) {
                  var allMoviesViewModel =
                      context.read<GetAllMoviesViewModel>();
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(genres[randomNumber],
                                // AppLocalizations.of(context)!.action,
                                style: AppStyles.regular20WhiteRoboto),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // BlocProvider.of<BottomViewModel>(context).buttnNavOntop(2);
                                    // //viewModel.buttnNavOntop(2);
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.see_more,
                                      style: AppStyles.regular16YellowRoboto),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.yellowColor,
                                  size: 15,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Container(
                          height: height * .32,
                          child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 16,
                                  ),
                              itemCount: allMoviesViewModel.allMovies!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => MovieItemWidget(
                                  movieId:
                                      allMoviesViewModel.allMovies![index].id!,
                                  image: allMoviesViewModel
                                      .allMovies![index].mediumCoverImage!,
                                  rating: allMoviesViewModel
                                      .allMovies![index].rating!)),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: Text("No movies available"));
              })
            ],
          ),
        ),
      ),
    );
  }
}

