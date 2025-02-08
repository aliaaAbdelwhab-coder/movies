import 'package:flutter/material.dart';
import 'movie_service.dart';

class MovieHomePage extends StatefulWidget {
  static const String routeName = "/movie_home";

  const MovieHomePage({super.key}); // Define route name

  @override
  _MovieHomePageState createState() => _MovieHomePageState();
}

class _MovieHomePageState extends State<MovieHomePage> {
  List movies = [];
  String category = "popular";
  final MovieService _movieService = MovieService();

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final data = await _movieService.fetchMovies(category);
    setState(() {
      movies = data;
    });
  }

  void changeCategory(String newCategory) {
    setState(() {
      category = newCategory;
      fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Movies ($category)"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              changeCategory(category == "popular" ? "top_rated" : "popular");
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home_icon'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search_icon'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'phone_icon'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person_icon'),
        ],
      ),
      body: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  // ignore: unnecessary_string_escapes
                  imageUrl: "D:\movies\movies\assets\imagesamerica_icon.png${movies[index]['america_icon']}",
                  rating: movies[index]['vote_average'].toString(),
                );
              },
            ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String rating;

  const MovieCard({super.key, required this.imageUrl, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 180,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
