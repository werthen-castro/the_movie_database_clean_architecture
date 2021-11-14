import 'dart:developer';

import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/movie_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_use_case.dart';

class HomePageController {
  final _listMovies = BehaviorSubject<List<MovieEntity>>();
  Stream<List<MovieEntity>> get listMovies => _listMovies.stream;

  final _page = BehaviorSubject<int>.seeded(1);
  Stream get page => _page.stream;

  final _genreSelected = BehaviorSubject<int>.seeded(28);
  Stream get genreSelected => _genreSelected.stream;

  final _loading = BehaviorSubject<bool>.seeded(false);
  Stream get loading => _loading.stream;

  final GetMovieUseCase movieUseCase;

  HomePageController(this.movieUseCase) {
    getListMovies();
  }

  getListMovies() async {
    final result = await movieUseCase(
        ListParams(genreId: _genreSelected.value, page: _page.value));

    result.fold((failureResponse) {}, (response) {
      _listMovies.add(response);
    });

    inspect(result);
  }
}
