import 'package:json_annotation/json_annotation.dart';
import 'package:movies/features/home/data/models/movie.dart';

part 'movie_list_responsebody.g.dart';
@JsonSerializable()
class MovieListResponsebody {
final String? status ;
@JsonKey(name:"status_message")
final String? statusMessage;
final MovieData? data;


  MovieListResponsebody(this.status, this.statusMessage, this.data

  );

  factory MovieListResponsebody.fromJson(Map<String, dynamic> json) => _$MovieListResponsebodyFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListResponsebodyToJson(this);
}
@JsonSerializable()
class MovieData {
 @JsonKey(name:"movie_count")
 final int? movieCount;
 final int? limit;
 @JsonKey(name:"page_number")
 final int? pageNumber;
 final List<Movie>? movies;
 
  MovieData(this.movieCount, this.limit, this.pageNumber, this.movies);

  factory MovieData.fromJson(Map<String, dynamic> json) => _$MovieDataFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDataToJson(this);
}