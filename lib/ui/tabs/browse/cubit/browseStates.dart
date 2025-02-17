import 'package:movies/models/movie_response.dart';

abstract class BrowMoviessestates {}
class BrowseMoviesLoadingState extends BrowMoviessestates{}


  class BrowsMoviesErrorState extends BrowMoviessestates {
  String errorMessage;
  BrowsMoviesErrorState({required this.errorMessage});
}

class BrowseMoviesSuccessState extends BrowMoviessestates {
  List<MoviesData> movies;

  BrowseMoviesSuccessState({required this.movies});
}
