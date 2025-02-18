abstract class BrowseStates{}

class BrowseInitialState extends BrowseStates{}

class BrowseLoadingState extends BrowseStates{}

class BrowseSuccessState extends BrowseStates{
   Set<String> genres;
  BrowseSuccessState({required this.genres});
}

class BrowseErrorState extends BrowseStates{
  String errorMessage;
  BrowseErrorState({required this.errorMessage});
}