import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieService {
  final String apiKey = "https://yts.mx/api"; 

  Future<List> fetchMovies(String category) async {
    const url = "https://yts.mx/api";
    
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['results'];
      }
    } catch (e) {
      print("Error fetching movies: $e");
    }
    return [];
  }
}
