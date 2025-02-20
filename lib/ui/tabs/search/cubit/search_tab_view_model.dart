import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/search/cubit/search_states.dart';

import '../../../../api/api_manager.dart';
import '../../../../models/movie_response.dart';

class SearchTabViewModel extends Cubit<SearchStates> {
  ApiManager apiManager = ApiManager();
  List<MoviesData> searchMovies = [];

  SearchTabViewModel() : super(SearchMoviesEmptyStates());

  // TODO: hold data - handle logic
  Future<MovieResponse?> getSearchMovies(String search) async {
    try {
      emit(SearchLoadingState());
      // Uri url = Uri.parse(
      //     "https://yts.mx/api/v2/list_movies.json?query_term=$search");
      // http.Response res = await http.get(url);
      // if (res.statusCode == 200 || res.statusCode == 201) {
      //   final json = jsonDecode(res.body);
      //   MovieResponse response = MovieResponse.fromJson(json);
      var response = await apiManager.getMovies(search: search);
      if (response!.status == 'ok') {
        if (response.data?.movieCount == 0) {
          emit(SearchMoviesEmptyStates());
        } else {
          searchMovies = response.data?.movies ?? [];

          print(searchMovies.length);
          emit(SearchSuccessState());
          print('Loading movies Success');
        }
      } else {
        emit(SearchErrorState(errorMessage: response.statusMessage!));
        print('Failed to load movies');
      }
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
}

// import 'dart:convert';
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:movies/models/MovieResponse.dart';
// import 'package:movies/models/SearchResponse.dart';
// import 'package:movies/ui/tabs/search/cubit/search_states.dart';
// import '../../../../api/api_manager.dart';
//
// class SearchTabViewModel extends Cubit<SearchStates> {
//  // ApiManager apiManager = ApiManager();
//   List<Movies> movies  =[];
//
//   SearchTabViewModel()
//       : super(SearchLoadingState());
//
//   // todo: hold data - handel logic
//   Future<MovieResponse?> getSearchMovies( String search) async {
//     try {
//       emit(SearchLoadingState());
//       Uri url = Uri.parse(
//           "https://yts.mx/api/v2/list_movies.json?query_term=$search");
//       http.Response res = await http.get(url);
//       if (res.statusCode == 200 || res.statusCode == 201) {
//         final json = jsonDecode(res.body);
//         MovieResponse response = MovieResponse.fromJson(json);
//         if (response.status == 'ok') {
//           if (response.data.movieCount == 0) {
//             emit(SearchMoviesEmptyStates());
//           }
//           movies = response.data?.movies ?? [];
//           print(movies.length);
//           emit(SearchSuccessState(searchMovies: response.data!));
//           print('Loading movies Success');
//         } else {
//           emit(SearchErrorState(errorMessage: response.statusMessage));
//           print('Failed to load movies');
//         }
//       }} catch (e) {
//       // print('no internet');
//       emit(SearchErrorState(errorMessage: e.toString()));
//       print(e);
//     }
//   }
// }
