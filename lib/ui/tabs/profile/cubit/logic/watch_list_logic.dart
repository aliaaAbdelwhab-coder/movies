import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiUrl = "https://yts.mx/api/v2/list_movies.json";

// Fetch watched movies (Modify API params if needed)
Future<List<dynamic>> fetchWatchedMovies() async {
  try {
    final response = await http.get(Uri.parse("$apiUrl?limit=10&sort_by=year"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data["status"] == "ok" && data["data"]["movies"] != null) {
        return data["data"]["movies"];
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to load movies (Status Code: ${response.statusCode}).");
    }
  } catch (e) {
    throw Exception("Error fetching movies: $e");
  }
}
