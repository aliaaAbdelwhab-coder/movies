import 'package:movies/models/get_watch_l_ist_response.dart';
import 'package:movies/models/movie_response.dart';
import 'package:movies/models/watch_l_ist_modle.dart';

abstract class Watchliststates {}

class InitialWatchliststate extends Watchliststates {}

class LoadingWatchliststate extends Watchliststates {}

class ErrorWatchliststate extends Watchliststates {
// List <String>  errorMessage =[];
  String? errorMessage;

  ErrorWatchliststate({required this.errorMessage});
}

class SuccessWatchliststate extends Watchliststates {
  WatchListModle watchListModle;

  SuccessWatchliststate({required this.watchListModle});
}
class SuccessGetWatchliststate extends Watchliststates {
  GetWatchListResponse movieResponse;

  SuccessGetWatchliststate({required this.movieResponse});
}
