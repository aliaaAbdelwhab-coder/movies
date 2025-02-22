class GetWatchListResponse {
  String? message;
  List<Data>? data;
  num  ?statusCode;
  GetWatchListResponse({this.message, this.data , this.statusCode});

  GetWatchListResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  static List<GetWatchListResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(GetWatchListResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
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
