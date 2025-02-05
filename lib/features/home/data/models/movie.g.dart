// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      (json['id'] as num).toInt(),
      json['url'] as String?,
      json['imdb_code'] as String?,
      json['title'] as String?,
      (json['year'] as num?)?.toInt(),
      (json['rating'] as num?)?.toDouble(),
      (json['geners'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['language'] as String?,
      json['background_image'] as String?,
      (json['torrents'] as List<dynamic>?)
          ?.map((e) => Torrents.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdb_code': instance.imdbCode,
      'title': instance.title,
      'year': instance.year,
      'rating': instance.rating,
      'geners': instance.geners,
      'language': instance.language,
      'background_image': instance.backgroundImage,
      'torrents': instance.torrents,
    };

Torrents _$TorrentsFromJson(Map<String, dynamic> json) => Torrents(
      json['url'] as String?,
      json['hash'] as String?,
      json['type'] as String?,
      (json['size'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TorrentsToJson(Torrents instance) => <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'type': instance.type,
      'size': instance.size,
    };
