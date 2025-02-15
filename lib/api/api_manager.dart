import 'package:movies/models/similar_model.dart';

import '../../../api/apiConstatnts.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/MovieDetailsResponse.dart';
import '../models/MovieResponse.dart';

class ApiManager {
  Future<MovieResponse?> getMovies() async {
    Uri url = Uri.https(Apiconstatnts.baseUrl, Apiconstatnts.moviesEndPoint ,{
      'sort_by' : 'year'
    });
    try {
      var response = await http.get(url);

      return MovieResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }


  Future<MovieDetailsResponse?> getMovieDetails(int movieId , String endPoint ) async {

    Uri url = Uri.https(Apiconstatnts.baseUrlmoviewDetials,endPoint, {
      'movie_id':'$movieId' ,
      "with_cast": 'true' ,
      "with_images" : 'true' , 
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
  Future<SimilarModel?> getMovieDetailsSimilar(int movieId , String endPoint ) async {

    Uri url = Uri.https(Apiconstatnts.baseUrlmoviewDetials,endPoint, {
      'movie_id':'$movieId'
      
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return SimilarModel.fromJson(jsonDecode(response.body));

      } else {
        print('Failed to load movies similar');
        // return null;
      }
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
