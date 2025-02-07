import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/home/cubit/movie_bloc_view_model.dart';
import 'package:movies/ui/tabs/home/cubit/movie_state.dart';
import 'package:movies/ui/tabs/home/movie_item.dart';
import 'package:movies/utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<MovieBlocViewModel, MovieState>(
          builder: (context, state) {
        if (state is MoviesInitialState || state is MoviesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.darkGreyColor,
            ),
          );
        } else if (state is MoviesSuccessState) {
          return MovieItem(movies: state.movies);
        } else if (state is MoviesErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return Container();
      }),
    );

    //   Container(
    //   height: height*.65,
    //   child: Stack(alignment: Alignment.center,
    //     fit: StackFit.expand,
    //     children: [
    //       Image.asset('assets/images/onBoarding_image6.png',fit: BoxFit.fitWidth,),
    //       Image.asset('assets/images/home.png'),
    //       CarouselSlider.builder(
    //           itemCount: 5,
    //           itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex){
    //             return SizedBox();
    //           },
    //           options: CarouselOptions(
    //         height: height * .66,
    //         viewportFraction: 0.72,
    //         enlargeCenterPage: true,
    //         enableInfiniteScroll: false,
    //       ),
    //       ),
    //
    //     ],
    //   ),
    // ); // just testing to see if the tabs are properly displayed
  }
}
