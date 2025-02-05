// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_responsebody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponsebody _$MovieListResponsebodyFromJson(
        Map<String, dynamic> json) =>
    MovieListResponsebody(
      json['status'] as String?,
      json['status_message'] as String?,
      json['data'] == null
          ? null
          : MovieData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieListResponsebodyToJson(
        MovieListResponsebody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
    };

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
      (json['movie_count'] as num?)?.toInt(),
      (json['limit'] as num?)?.toInt(),
      (json['page_number'] as num?)?.toInt(),
      (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDataToJson(MovieData instance) => <String, dynamic>{
      'movie_count': instance.movieCount,
      'limit': instance.limit,
      'page_number': instance.pageNumber,
      'movies': instance.movies,
    };
