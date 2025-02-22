class WatchListModle {
  List<String>? message;
  Data? data;
  // String ? message;
  int? statusCode;
  String? error;
  WatchListModle({ this.data, this.statusCode, this.error ,this.message});

  WatchListModle.fromJson(Map<String, dynamic> json) {
    message = [json["message"]] ;
    // messageList = json["message"];
    statusCode = json["statusCode"];
    error = json["error"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<WatchListModle> fromList(List<Map<String, dynamic>> list) {
    return list.map(WatchListModle.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? movieId;
  String? name;
  num? rating;
  String? imageUrl;
  String? year;

  Data({this.movieId, this.name, this.rating, this.imageUrl, this.year});

  Data.fromJson(Map<String, dynamic> json) {
    movieId = json["movieId"];
    name = json["name"];
    rating = json["rating"];
    imageUrl = json["imageURL"];
    year = json["year"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["movieId"] = movieId;
    _data["name"] = name;
    _data["rating"] = rating;
    _data["imageURL"] = imageUrl;
    _data["year"] = year;
    return _data;
  }
}
