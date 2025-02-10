import 'package:movies/models/MovieResponse.dart';

import '../../../../../api/api_manager.dart';

class MovieRepository {
  ApiManager apiManager;

  MovieRepository({required this.apiManager});

  Future<MovieResponse?> getMovies() async {
    return await apiManager.getMovies();
  }
}

//
// abstract class HomeTabRepository {
//   Future<MovieResponse?> getMovies();
//
// }
//
// @Injectable(as: HomeTabRepository)
// class HomeTabRepositoryImpl extends HomeTabRepository {
//   final HomeTabRemoteDataSource homeTabRemoteDataSource;
//   HomeTabRepositoryImpl(this.homeTabRemoteDataSource);
//   @override
//   Future<MovieResponse?> getMovies() async {
//     try {
//       final check = await Connectivity().checkConnectivity();
//       if (check.contains(ConnectivityResult.wifi) ||
//           check.contains(ConnectivityResult.mobile)) {
//         final result = await homeTabRemoteDataSource.getMovies();
//         return result;
//       }
//     } catch (e) {
//       throw e.toString();
//     }
//   }
// }
