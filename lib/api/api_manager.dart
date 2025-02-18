
import 'package:movies/models/MovieDetailsResponse.dart';

import 'package:movies/models/movie_response.dart';
import 'package:movies/models/similar_model.dart';

import '../../../api/apiConstatnts.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/MovieDetailsResponse.dart';

import 'package:movies/models/similar_model.dart';
import 'package:movies/ui/tabs/profile/get_profile_model.dart';

import '../../../api/apiConstatnts.dart';


class ApiManager {


  Future<MovieResponse?> getMovies({String? genre}) async {
    Uri url = Uri.https(Apiconstatnts.baseUrl, Apiconstatnts.moviesEndPoint ,{
      'sort_by' : 'year',
      'genre':genre
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

  Future<Set<String>> getMovieGenres() async {
    try {
      MovieResponse? movieResponse = await getMovies();
      if (movieResponse != null && movieResponse.data?.movies != null) {
        return await getGenresFromMovies(movieResponse.data!.movies!);
      }
      return {};
    } catch (e) {
      print(e);
      return {};
    }
  }

  Future<Set<String>> getGenresFromMovies(List<MoviesData> movies) async {
    Set<String> genresSet = {};
    for (var movie in movies) {
      genresSet.addAll(movie.genres ?? []);
    }
    return genresSet;
  }


  Future<GetProfileModel> getProfileData() async {
    Uri url =
        Uri.https(Apiconstatnts.baseUrl, Apiconstatnts.getProfileEndPoint);
    try {
      var response = await http.get(url);

      return GetProfileModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }

}
