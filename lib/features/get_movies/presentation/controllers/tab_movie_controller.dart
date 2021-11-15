import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_use_case.dart';

class TabMovieController {
  final _listMovies = BehaviorSubject<List<MovieEntity>>();
  Stream<List<MovieEntity>> get listMovies => _listMovies.stream;

  final _page = BehaviorSubject<int>.seeded(1);
  Stream get page => _page.stream;

  final GetMovieUseCase movieUseCase;

  TabMovieController(this.movieUseCase, genreId) {
    getListMovies(genreId);
  }

  getListMovies(genreId) async {
    final result =
        await movieUseCase(ListParams(genreId: genreId, page: _page.value));

    result.fold((failureResponse) {}, (response) {
      _listMovies.add(response);
    });

    inspect(result);
  }
}