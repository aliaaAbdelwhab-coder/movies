import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/tabs/search/cubit/search_states.dart';
import 'package:movies/ui/tabs/search/cubit/search_tab_view_model.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/widget/MovieItemWidget.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = 'search_screen';

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => SearchTabViewModel(),
      child: Builder(
        builder: (context) {
          var viewModel = context.read<SearchTabViewModel>();
          return Scaffold(
            backgroundColor: Colors.black,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (search) {
                        if (search != null && search.isNotEmpty) {
                          viewModel.getSearchMovies(search);
                        }
                      },
                      controller: searchController,
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
                  BlocBuilder<SearchTabViewModel, SearchStates>(
                    builder: (context, state) {
                      if (state is SearchLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.yellowColor,
                          ),
                        );
                      }
                      if (state is SearchMoviesEmptyStates) {
                        return Expanded(
                          child: Image.asset(
                            "assets/images/Empty.png",
                          ),
                        );
                      }
                      if (state is SearchErrorState) {
                        return Center(
                          child: Text(state.errorMessage),
                        );
                      }
                      if (state is SearchSuccessState) {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: viewModel.searchMovies.length,
                            // عدد مؤقت
                            itemBuilder: (context, index) {
                              return MovieItemWidget(
                                movieId: index,
                                image: viewModel
                                    .searchMovies[index].mediumCoverImage!,
                                rating: viewModel.searchMovies[index].rating!
                                    .toDouble(),
                              );
                            },
                          ),
                        );
                      }
                      return Expanded(
                        child: Image.asset(
                          alignment: Alignment.center,
                          "assets/images/Empty.png",
                          width: size.width * .3,
                          height: size.height * .3,
                          // color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
        // child: Scaffold(
        //   backgroundColor: Colors.black,
        //   body: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(height: 20),
        //         Container(
        //           decoration: BoxDecoration(
        //             color: Color(0xFF2A2A2A),
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: TextField(
        //             controller: _searchController,
        //             style: TextStyle(color: Colors.white),
        //             decoration: InputDecoration(
        //               hintText: "Search",
        //               hintStyle: TextStyle(color: Colors.white70),
        //               prefixIcon: Padding(
        //                 padding: EdgeInsets.all(10),
        //                 child: Image.asset(
        //                   "assets/images/search_icon.png",
        //                   width: 20,
        //                   height: 20,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               border: InputBorder.none,
        //               contentPadding: EdgeInsets.symmetric(vertical: 12),
        //             ),
        //           ),
        //         ),
        //         SizedBox(height: 20),
        //         Expanded(
        //           child: GridView.builder(
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               crossAxisSpacing: 10,
        //               mainAxisSpacing: 10,
        //               childAspectRatio: 0.65,
        //             ),
        //             itemCount: 6, // عدد مؤقت
        //             itemBuilder: (context, index) {
        //               return MovieItemWidget(
        //                 movieId: index,
        //                 image: "",
        //                 rating: 7.7,
        //               );
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

