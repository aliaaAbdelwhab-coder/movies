import 'package:dio/dio.dart';
import 'package:movies/features/home/data/models/movie_list_responsebody.dart';
import 'package:movies/utils/networking/api_constant.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
// @Headers( "en")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET(ApiConstant.movieList)
  Future<MovieListResponsebody>getMovieList(
    {
      @Query("limit") int ? limit  , 
      @Query("quality") String ? quality  ,
      @Query("minimum_rating") int ? minimumRating  , 
      @Query("query_team") String ? queryTeam  , 
      @Query("genre") String ? genre  , 
      @Query("sort_by") String ? sortBy  , 
      @Query("order_by") String ? orderBy	  , 
      @Query("with_rt_ratings") bool ? withRtRatings	  , 

    }
  );

}