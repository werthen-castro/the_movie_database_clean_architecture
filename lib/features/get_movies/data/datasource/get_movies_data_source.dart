import 'package:the_movie_database_clean_arch/features/get_movies/data/models/movie_model.dart';

abstract class GetMoviesDataSource {
  Future<List<MovieModel>> getMovies(
      {required int page, required int genereId});
}
