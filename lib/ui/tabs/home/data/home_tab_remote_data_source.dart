

import 'package:movies/models/movie_response.dart';

abstract class HomeTabRemoteDataSource {
  Future<MovieResponse?> getMovies();
}

