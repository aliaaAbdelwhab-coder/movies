import '../../../../models/MovieResponse.dart';

abstract class HomeTabRemoteDataSource {
  Future<MovieResponse?> getMovies();
}

