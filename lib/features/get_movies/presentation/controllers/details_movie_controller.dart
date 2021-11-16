import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_for_id_use_case.dart';
import 'package:the_movie_database_clean_arch/usecases/usecase.dart';

class DetailsMovieController {
  final _movie = BehaviorSubject<DetailsMovieEntity>();
  Stream<DetailsMovieEntity> get movie => _movie.stream;

  final GetMovieForIdUseCase useCase;

  DetailsMovieController(this.useCase, movieId) {
    getDetailsMovie(movieId);
  }

  getDetailsMovie(int movieId) async {
    final result = await useCase(ListParams(id: movieId));

    result.fold((failureResponse) {}, (response) {
      _movie.add(response);
    });

    inspect(result);
  }
}
