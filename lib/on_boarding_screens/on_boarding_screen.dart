import 'package:flutter/material.dart';

import '../home.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'on Boarding Screen';

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      image: 'assets/images/onBoarding_image2.png',
      title: 'Discover Movies',
      description:
          'Explore a vast collection of movies in all qualities and genres.'
          ' Find your next favorite film with ease.',
    ),
    OnboardingPage(
      image: 'assets/images/onBoarding_image3.png',
      title: 'Explore All Genres',
      description:
          'Discover movies from every genre, in all available qualities.'
          ' Find something new and exciting to watch every day.',
    ),
    OnboardingPage(
      image: 'assets/images/onBoarding_image4.png',
      title: 'Create Watchlists',
      description:
          'Save movies to your watchlist to keep track of what you want to watch next.'
          ' Enjoy films in various qualities and genres.',
    ),
    OnboardingPage(
      image: 'assets/images/onBoarding_image5.png',
      title: 'Rate, Review, and Learn',
      description: 'Share your thoughts on the movies you have watched. '
          'Dive deep into film details and help others discover great movies with your reviews.',
    ),
    OnboardingPage(
        image: 'assets/images/onBoarding_image6.png',
        title: 'Rate, Review, and Learn',
        description: null),
  ];

  void navigatePage(int direction) {
    // todo: Animate to the next or previous page
    pageController.animateToPage(
      currentPage + direction,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        // todo: Update the current page index
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Image Background
              Image.asset(
                pages[index].image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

              // Modal Bottom Sheet
              customBottomSheet(pages[index], index),
            ],
          );
        },
      ),
    );
  }

  Widget CustomPage(OnboardingPage page, int index) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            page.image,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ],
      ),
      bottomSheet: customBottomSheet(page, index),
    );
  }

  Widget customBottomSheet(OnboardingPage page, int index) {
    final bool isLastPage = index == pages.length - 1;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final bool isFirstPage = index == 0;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Material(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          child: Container(
            width: width * 1,
            padding: EdgeInsets.symmetric(
                horizontal: width * .04, vertical: height * .03),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  page.title,
                  style: AppStyles.bold24WhiteInter,
                ),

                // Description (if not last page)
                if (!isLastPage) ...[
                  SizedBox(height: height * .02),
                  Text(
                    page.description!,
                    textAlign: TextAlign.center,
                    style: AppStyles.regular20WhiteInter,
                  ),
                ],

                SizedBox(height: height * .02),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: isFirstPage
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    // todo: Back Button (not shown on first page)
                    if (!isFirstPage)
                      ElevatedButton(
                        onPressed: () {
                          navigatePage(-1);
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * .04,
                                vertical: height * .016),
                            backgroundColor: AppColors.blackColor,
                            side: BorderSide(
                                color: AppColors.yellowColor, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: Text('Back',
                            style: AppStyles.semiBold20YellowInter),
                      ),
                    SizedBox(
                      height: height * .02,
                    ),
                    //todo: Next or Finish Started Button
                    ElevatedButton(
                      onPressed: () {
                        if (isLastPage) {
                          // todo: Navigate to login screen
                          Navigator.of(context).pushNamed(Home.homeRoute);
                          print('Navigate to login screen');
                        } else {
                          navigatePage(1);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * .04, vertical: height * .016),
                          backgroundColor: AppColors.yellowColor,
                          side: BorderSide(
                              color: AppColors.yellowColor, width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: Text(
                        isLastPage ? 'Finish' : 'Next',
                        style: AppStyles.semiBold20BlackInter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage {
  final String image;
  final String title;
  String? description;

  OnboardingPage({
    required this.image,
    required this.title,
    this.description,
  });
}
