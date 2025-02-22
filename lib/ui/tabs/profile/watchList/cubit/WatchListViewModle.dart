import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/get_watch_l_ist_response.dart';
import 'package:movies/models/movie_response.dart';
import 'package:movies/models/watch_l_ist_modle.dart';
import 'package:movies/ui/tabs/profile/watchList/cubit/watchListStates.dart';

class Watchlistviewmodle extends Cubit<Watchliststates> {
  Watchlistviewmodle() : super(InitialWatchliststate());
  ApiManager apiManager = ApiManager();
  addWatchList(
      {required String movieId,
      required String name,
      required num rating,
      required String imageURL,
      required String year}) async {
    emit(LoadingWatchliststate());

    try {
      WatchListModle? response = await apiManager.addWatchList(
          movieId: movieId,
          name: name,
          rating: rating,
          imageURL: imageURL,
          year: year);
      if (response!.statusCode != null && response.statusCode! >= 400) {
        emit(ErrorWatchliststate(errorMessage: response.message?[0]));
      } else {
        emit(SuccessWatchliststate(watchListModle: response));
      }
    } catch (e) {
      emit(ErrorWatchliststate(errorMessage: e.toString()));
    }
  }

  getWatchList() async {
    emit(LoadingWatchliststate());

    try {
      GetWatchListResponse? response = await apiManager.getWatchLIstMOvies();
      if (response!.statusCode != null && response.statusCode! >= 400) {
        emit(ErrorWatchliststate(errorMessage: response.message));
      } else {
        emit(SuccessGetWatchliststate(movieResponse: response));
      }
    } catch (e) {
      emit(ErrorWatchliststate(errorMessage: e.toString()));
    }
  }
}
