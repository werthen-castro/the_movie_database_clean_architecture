import 'package:dartz/dartz.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/usecases/usecase.dart';

class SearchMovieUseCase implements Usecase<List<MovieEntity>, ListParams> {
  final GetMovieRepository repository;

  SearchMovieUseCase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(ListParams params) async {
    return repository.searchMovie(page: params.page!, name: params.name!);
  }
}
