import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/apiConstatnts.dart';
import 'package:movies/ui/tabs/home/movei_details/similar/cubit/similarViewModle.dart';
import 'package:movies/ui/tabs/home/movei_details/similar/cubit/states.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widget/MovieItemWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                state.errorMessage,
                style: AppStyles.regular16WhiteRoboto,
              ),
            );
          } else if (state is SimilarSuccessState) {
            
            return Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height*0.02,),
                Text(AppLocalizations.of(context)!.similar ,
                 style: AppStyles.bold24WhiteRoboto,),
                 SizedBox(height: size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Movieitemwidget(movieId: state.movies[0].id!, 
                    image:state.movies[0].mediumCoverImage! ,
                     rating: state.movies[0].rating?? 0.0),
                    Movieitemwidget(movieId: state.movies[1].id!, 
                    image:state.movies[1].mediumCoverImage! ,
                     rating: state.movies[1].rating?? 0.0)
                  ],
                ),
                SizedBox(height: size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Movieitemwidget(movieId: state.movies[2].id!, 
                    image:state.movies[2].mediumCoverImage! ,
                     rating: state.movies[2].rating?? 0.0),
                    Movieitemwidget(movieId: state.movies[3].id!, 
                    image:state.movies[3].mediumCoverImage! ,
                     rating: state.movies[3].rating?? 0.0)
                  ],
                ),                
              ],
            );
          }
          return Container();
        });
  }
}
