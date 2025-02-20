import 'package:flutter/material.dart';
import 'package:movies/widget/MovieItemWidget.dart';

class SearchTab extends StatelessWidget {
  static const String routeName = 'search_screen';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), 
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF2A2A2A), 
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white), 
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/search_icon.png", 
                      width: 20,
                      height: 20,
                      color: Colors.white, 
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: 6, // عدد مؤقت
                itemBuilder: (context, index) {
                  return Movieitemwidget(
                    movieId: index, 
                    image: "", 
                    rating: 7.7, 
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

