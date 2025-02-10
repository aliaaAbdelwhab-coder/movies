//https://yts.am/api/v2/list_movies.json
// https://yts.am/api/v2/list_movies.jsonp
// https://yts.am/api/v2/list_movies.xml

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';
import 'package:movies/models/MovieDetailsResponse.dart';

import '../models/MovieResponse.dart';

class ApiManager {
  Future<MovieResponse?> getMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.moviesEndPoint);
    try {
      var response = await http.get(url);

      return MovieResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.moviesEndPoint, {
      'id': movieId.toString(),
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return MovieDetailsResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to load movie details');
        // return null;
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
