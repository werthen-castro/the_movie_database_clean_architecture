import 'package:rxdart/rxdart.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/search_movie_use_case.dart';
import 'package:the_movie_database_clean_arch/usecases/usecase.dart';

class SearchMovieController {
  final _listMovies = BehaviorSubject<List<MovieEntity>>();
  Stream<List<MovieEntity>> get listMovies => _listMovies.stream;

  final _isloading = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isloading => _isloading.stream;

  final _page = BehaviorSubject<int>.seeded(1);
  Stream get page => _page.stream;

  final SearchMovieUseCase usecase;

  SearchMovieController(this.usecase);

  searchMovies(String text) async {
    final result = await usecase(ListParams(name: text, page: _page.value));

    result.fold((failureResponse) {
      _listMovies.addError(failureResponse);
    }, (response) {
      _listMovies.add(response);
    });
  }
}
