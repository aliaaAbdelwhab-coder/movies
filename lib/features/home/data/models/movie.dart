import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';
@JsonSerializable()
class Movie {
  final int id;
  final String? url;
  @JsonKey(name: "imdb_code")
  final String? imdbCode;
  final String? title;
  final int? year;
  final double? rating;
  final List <String>? geners;
  final String? language;
  @JsonKey(name: "background_image")
  final String? backgroundImage;
  final List <Torrents>? torrents;


  


  Movie(this.id, this.url, this.imdbCode, this.title, this.year, this.rating, this.geners, this.language, this.backgroundImage, this.torrents);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
@JsonSerializable()
class Torrents {
  final String? url;
  final String? hash;
  final String? type;
  final double? size;


  Torrents(this.url, this.hash, this.type, this.size);

  factory Torrents.fromJson(Map<String, dynamic> json) => _$TorrentsFromJson(json);
  Map<String, dynamic> toJson() => _$TorrentsToJson(this);
}