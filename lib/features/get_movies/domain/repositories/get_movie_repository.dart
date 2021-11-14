import 'package:dartz/dartz.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';

abstract class GetMovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required int page, required int genreId});
}
