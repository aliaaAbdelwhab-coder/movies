abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchMoviesEmptyStates extends SearchStates {}

class SearchErrorState extends SearchStates {
  String errorMessage;

  SearchErrorState({required this.errorMessage});
}

class SearchSuccessState extends SearchStates {}
