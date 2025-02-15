
class SimilarModel {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  SimilarModel({this.status, this.statusMessage, this.data, this.meta});

  SimilarModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["status_message"] is String) {
      statusMessage = json["status_message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if(json["@meta"] is Map) {
      meta = json["@meta"] == null ? null : Meta.fromJson(json["@meta"]);
    }
  }

  static List<SimilarModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SimilarModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["status_message"] = statusMessage;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    if(meta != null) {
      _data["@meta"] = meta?.toJson();
    }
    return _data;
  }
}

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

Meta({this.serverTime, this.serverTimezone, this.apiVersion, this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    if(json["server_time"] is int) {
      serverTime = json["server_time"];
    }
    if(json["server_timezone"] is String) {
      serverTimezone = json["server_timezone"];
    }
    if(json["api_version"] is int) {
      apiVersion = json["api_version"];
    }
    if(json["execution_time"] is String) {
      executionTime = json["execution_time"];
    }
  }

  static List<Meta> fromList(List<Map<String, dynamic>> list) {
    return list.map(Meta.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["server_time"] = serverTime;
    _data["server_timezone"] = serverTimezone;
    _data["api_version"] = apiVersion;
    _data["execution_time"] = executionTime;
    return _data;
  }
}

class Data {
  int? movieCount;
  List<MoviesSimilar>? movies;

  Data({this.movieCount, this.movies});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["movie_count"] is int) {
      movieCount = json["movie_count"];
    }
    if(json["movies"] is List) {
      movies = json["movies"] == null ? null : (json["movies"] as List).map((e) => MoviesSimilar.fromJson(e)).toList();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["movie_count"] = movieCount;
    if(movies != null) {
      _data["movies"] = movies?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class MoviesSimilar {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  double? rating;
  num? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  num? dateUploadedUnix;

  MoviesSimilar({this.id, this.url, this.imdbCode, this.title, this.titleEnglish, this.titleLong, this.slug, this.year, this.rating, this.runtime, this.genres, this.summary, this.descriptionFull, this.synopsis, this.ytTrailerCode, this.language, this.mpaRating, this.backgroundImage, this.backgroundImageOriginal, this.smallCoverImage, this.mediumCoverImage, this.state, this.torrents, this.dateUploaded, this.dateUploadedUnix});

  MoviesSimilar.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["imdb_code"] is String) {
      imdbCode = json["imdb_code"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["title_english"] is String) {
      titleEnglish = json["title_english"];
    }
    if(json["title_long"] is String) {
      titleLong = json["title_long"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["year"] is int) {
      year = json["year"];
    }
    if(json["rating"] is double) {
      rating = json["rating"];
    }
    if(json["runtime"] is int) {
      runtime = json["runtime"];
    }
    if(json["genres"] is List) {
      genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if(json["summary"] is String) {
      summary = json["summary"];
    }
    if(json["description_full"] is String) {
      descriptionFull = json["description_full"];
    }
    if(json["synopsis"] is String) {
      synopsis = json["synopsis"];
    }
    if(json["yt_trailer_code"] is String) {
      ytTrailerCode = json["yt_trailer_code"];
    }
    if(json["language"] is String) {
      language = json["language"];
    }
    if(json["mpa_rating"] is String) {
      mpaRating = json["mpa_rating"];
    }
    if(json["background_image"] is String) {
      backgroundImage = json["background_image"];
    }
    if(json["background_image_original"] is String) {
      backgroundImageOriginal = json["background_image_original"];
    }
    if(json["small_cover_image"] is String) {
      smallCoverImage = json["small_cover_image"];
    }
    if(json["medium_cover_image"] is String) {
      mediumCoverImage = json["medium_cover_image"];
    }
    if(json["state"] is String) {
      state = json["state"];
    }
    if(json["torrents"] is List) {
      torrents = json["torrents"] == null ? null : (json["torrents"] as List).map((e) => Torrents.fromJson(e)).toList();
    }
    if(json["date_uploaded"] is String) {
      dateUploaded = json["date_uploaded"];
    }
    if(json["date_uploaded_unix"] is int) {
      dateUploadedUnix = json["date_uploaded_unix"];
    }
  }

  static List<MoviesSimilar> fromList(List<Map<String, dynamic>> list) {
    return list.map(MoviesSimilar.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["url"] = url;
    _data["imdb_code"] = imdbCode;
    _data["title"] = title;
    _data["title_english"] = titleEnglish;
    _data["title_long"] = titleLong;
    _data["slug"] = slug;
    _data["year"] = year;
    _data["rating"] = rating;
    _data["runtime"] = runtime;
    if(genres != null) {
      _data["genres"] = genres;
    }
    _data["summary"] = summary;
    _data["description_full"] = descriptionFull;
    _data["synopsis"] = synopsis;
    _data["yt_trailer_code"] = ytTrailerCode;
    _data["language"] = language;
    _data["mpa_rating"] = mpaRating;
    _data["background_image"] = backgroundImage;
    _data["background_image_original"] = backgroundImageOriginal;
    _data["small_cover_image"] = smallCoverImage;
    _data["medium_cover_image"] = mediumCoverImage;
    _data["state"] = state;
    if(torrents != null) {
      _data["torrents"] = torrents?.map((e) => e.toJson()).toList();
    }
    _data["date_uploaded"] = dateUploaded;
    _data["date_uploaded_unix"] = dateUploadedUnix;
    return _data;
  }
}

class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;

  Torrents({this.url, this.hash, this.quality, this.isRepack, this.videoCodec, this.bitDepth, this.audioChannels, this.seeds, this.peers, this.size, this.sizeBytes, this.dateUploaded, this.dateUploadedUnix});

  Torrents.fromJson(Map<String, dynamic> json) {
    if(json["url"] is String) {
      url = json["url"];
    }
    if(json["hash"] is String) {
      hash = json["hash"];
    }
    if(json["quality"] is String) {
      quality = json["quality"];
    }
    if(json["is_repack"] is String) {
      isRepack = json["is_repack"];
    }
    if(json["video_codec"] is String) {
      videoCodec = json["video_codec"];
    }
    if(json["bit_depth"] is String) {
      bitDepth = json["bit_depth"];
    }
    if(json["audio_channels"] is String) {
      audioChannels = json["audio_channels"];
    }
    if(json["seeds"] is int) {
      seeds = json["seeds"];
    }
    if(json["peers"] is int) {
      peers = json["peers"];
    }
    if(json["size"] is String) {
      size = json["size"];
    }
    if(json["size_bytes"] is int) {
      sizeBytes = json["size_bytes"];
    }
    if(json["date_uploaded"] is String) {
      dateUploaded = json["date_uploaded"];
    }
    if(json["date_uploaded_unix"] is int) {
      dateUploadedUnix = json["date_uploaded_unix"];
    }
  }

  static List<Torrents> fromList(List<Map<String, dynamic>> list) {
    return list.map(Torrents.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["hash"] = hash;
    _data["quality"] = quality;
    _data["is_repack"] = isRepack;
    _data["video_codec"] = videoCodec;
    _data["bit_depth"] = bitDepth;
    _data["audio_channels"] = audioChannels;
    _data["seeds"] = seeds;
    _data["peers"] = peers;
    _data["size"] = size;
    _data["size_bytes"] = sizeBytes;
    _data["date_uploaded"] = dateUploaded;
    _data["date_uploaded_unix"] = dateUploadedUnix;
    return _data;
  }
}