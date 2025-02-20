import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies/ui/tabs/browse/browsGetMoviesUI.dart';
import 'package:movies/ui/tabs/browse/cubit/browse%20view%20model.dart';
import 'package:movies/ui/tabs/browse/genre%20category.dart';
import 'package:movies/utils/app_colors.dart';

import 'cubit/browse states.dart';

class BrowseTab extends StatefulWidget {
  static const String routeName = 'browse_screen';

  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;
  BrowseViewModel viewModel = BrowseViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.fetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: BlocBuilder<BrowseViewModel, BrowseStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is BrowseLoadingState) {
            return Center(
                child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ));
          } else if (state is BrowseSuccessState) {
            Set<String> genres = state.genres;
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: genres.length,
                      child: TabBar(
                        onTap: (index) {
                          selectedIndex = index;
                          setState(() {});
                        },
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: AppColors.transparent,
                        dividerColor: AppColors.transparent,
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: height * 0.02),
                        tabs: genres
                            .toList()
                            .asMap()
                            .entries
                            .map((entry) => GenreCategory(
                                  genreName: entry.value,
                                  isSelected: selectedIndex == entry.key,
                                ))
                            .toList(),
                      ),
                    ),
                    // Expanded(
                    //     child: Browsgetmoviesui(
                    //         genre: state.genres.elementAt(selectedIndex)))
                  ],
                ),
              ),
            );
            // return Expanded(
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: genres.length,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         child: GenreCategory(
            //             genreName: genres.elementAt(index),
            //             isSelected:selectedIndex==index
            //
            //         ),
            //       );
            //     },
            //   ),
            // );
          } else if (state is BrowseErrorState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return Container(); // Handle other states if needed
        },
      ),
    );

  }
}
