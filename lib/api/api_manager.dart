//https://yts.am/api/v2/list_movies.json
// https://yts.am/api/v2/list_movies.jsonp
// https://yts.am/api/v2/list_movies.xml

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_constants.dart';

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

}
