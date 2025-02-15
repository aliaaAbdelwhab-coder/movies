import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/tabs/home/movei_details/similar/cubit/states.dart';

class Similarviewmodle extends Cubit<SimilarState>{
    ApiManager apiManager = ApiManager();
  int movieId;

  Similarviewmodle({required this.movieId})
      : super(SimilarLoadingState());

  // todo: hold data - handel logic
  Future<void> getMovieDetailsSimilar(String endPoin) async {
    try {
      emit(SimilarLoadingState());
      var response = await apiManager.getMovieDetailsSimilar(movieId ,endPoin);

        if ( response!.status == 'ok') {

          emit(SimilarSuccessState(movies:response.data!.movies!,

          ));
        print('Loading movies Success');
      } else {
        emit(SimilarErrorState(errorMessage: response.statusMessage!));
        print('Failed to load movies');
      }
     } catch (e) {
      // print('no internet');
      emit(SimilarErrorState(errorMessage: e.toString()));
      print(e);
    }
  }

}