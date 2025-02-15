

import 'package:movies/models/similar_model.dart';

abstract class SimilarState {}

// class InitialState extends SimilarState {}

class SimilarLoadingState extends SimilarState {}

class SimilarErrorState extends SimilarState {
  String errorMessage;
  SimilarErrorState({required this.errorMessage});
}

class SimilarSuccessState extends SimilarState {
  List<MoviesSimilar> movies;

  SimilarSuccessState({required this.movies});
}
