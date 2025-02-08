import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../api/api_constants.dart';
import '../../../../models/MovieResponse.dart';
import 'home_tab_remote_data_source.dart';

@Injectable(as: HomeTabRemoteDataSource)
class HomeScreenRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  @override
  Future<MovieResponse?> getMovies() async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
    );
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load movies:${response.statusCode}');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
