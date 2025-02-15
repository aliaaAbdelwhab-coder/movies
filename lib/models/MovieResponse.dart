import 'package:json_annotation/json_annotation.dart';

part 'MovieResponse.g.dart';

@JsonSerializable()
class MovieResponse {
   String ?status;
  @JsonKey(name: 'status_message')
   String ? statusMessage;
   Data ?data;
  @JsonKey(name: '@meta')
   Meta? meta;

  MovieResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'movie_count')
   int ?movieCount;
   int ?limit;
  @JsonKey(name: 'page_number')
   int ? pageNumber;
   List<Movie> ? movies;

  Data({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Movie {
   int ?id;
   String ?url;
  @JsonKey(name: 'imdb_code')
   String ? imdbCode;
   String? title;
  @JsonKey(name: 'title_english')
   String ?titleEnglish;
  @JsonKey(name: 'title_long')
   String ?titleLong;
   String? slug;
   int? year;
   double ?rating;
   int? runtime;
   List<String> ?genres;
   String? summary;
  @JsonKey(name: 'description_full')
   String ? descriptionFull;
   String ?synopsis;
  @JsonKey(name: 'yt_trailer_code')
   String ?ytTrailerCode;
   String ? language;
  @JsonKey(name: 'mpa_rating')
   String? mpaRating;
  @JsonKey(name: 'background_image')
   String ? backgroundImage;
  @JsonKey(name: 'background_image_original')
   String  ?backgroundImageOriginal;
  @JsonKey(name: 'small_cover_image')
   String? smallCoverImage;
  @JsonKey(name: 'medium_cover_image')
   String ? mediumCoverImage;
  @JsonKey(name: 'large_cover_image')
   String largeCoverImage;
  String ?state;
   List<Torrent> ? torrents;
  @JsonKey(name: 'date_uploaded')
   String ? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
   int ? dateUploadedUnix;

  Movie({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.state,
    required this.torrents,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Torrent {
   String ? url;
   String ?hash;
   String ?quality;
   String ?type;
  @JsonKey(name: 'is_repack')
   String ?isRepack;
  @JsonKey(name: 'video_codec')
   String ?videoCodec;
  @JsonKey(name: 'bit_depth')
   String ?bitDepth;
  @JsonKey(name: 'audio_channels')
   String ?audioChannels;
   int ?seeds;
   int ?peers;
   String ?size;
  @JsonKey(name: 'size_bytes')
   int ?sizeBytes;
  @JsonKey(name: 'date_uploaded')
   String? dateUploaded;
  @JsonKey(name: 'date_uploaded_unix')
   int ?dateUploadedUnix;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: 'server_time')
   int ? serverTime;
  @JsonKey(name: 'server_timezone')
   String? serverTimezone;
  @JsonKey(name: 'api_version')
   int ?apiVersion;
  @JsonKey(name: 'execution_time')
   String ?executionTime;

  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
