import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Register/registerUI.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/home.dart';
import 'package:movies/ui/forgot_password/forgot_password_screen.dart';
import 'package:movies/ui/login/login%20screen.dart';
import 'package:movies/ui/tabs/browse/browse_tab.dart';
import 'package:movies/ui/tabs/home/cubit/movie_bloc_view_model.dart';
import 'package:movies/ui/tabs/home/home_tab.dart';
import 'package:movies/ui/tabs/home/repository/movie_repository.dart';
import 'package:movies/ui/tabs/profile/profile_tab.dart';
import 'package:movies/ui/tabs/search/search_tab.dart';
import 'package:movies/utils/app_theme.dart';
import 'package:movies/widget/my_bloc_observer.dart';

import 'on_boarding_screens/Introduction_screen.dart';
import 'on_boarding_screens/on_boarding_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MovieBlocViewModel(
            moviesRepository: MovieRepository(apiManager: ApiManager())),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.myTheme,
          initialRoute: IntroductionScreen.routeName,
          routes: {
            IntroductionScreen.routeName: (context) => IntroductionScreen(),
            OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
            Home.homeRoute: (context) => Home(),
            Registerui.registerRoute: (context) => Registerui(),
            LoginScreen.routeName: (context) => LoginScreen(),
            ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
            HomeTab.routeName: (context) => HomeTab(),
            ProfileTab.routeName: (context) => ProfileTab(),
            SearchTab.routeName: (context) => SearchTab(),
            BrowseTab.routeName: (context) => BrowseTab(),
            // UpdateProfile.routeName : (context) => UpdateProfile(),
          },
        ));
  }
}
