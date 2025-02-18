import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/ui/tabs/browse/cubit/browseStates.dart';

class Browseviewmodle extends Cubit<BrowMoviessestates> {
  Browseviewmodle() : super(BrowseMoviesLoadingState());
ApiManager apiManager = ApiManager();
  void getBrowsMovies (String genre)async{
    
      try {
      emit(BrowseMoviesLoadingState());
      var response = await apiManager.getMovies(genre:genre );
      if (response!.status == 'ok') {
        emit(BrowseMoviesSuccessState(movies: response.data!.movies!));
        print('Loading movies Success');
      } else {
        emit(BrowsMoviesErrorState(errorMessage: response.statusMessage!));
        print('Failed to load movies');
      }
    } catch (e) {
      // print('no internet');
      emit(BrowsMoviesErrorState(errorMessage: e.toString()));
      print(e);
    }
  }
  }

