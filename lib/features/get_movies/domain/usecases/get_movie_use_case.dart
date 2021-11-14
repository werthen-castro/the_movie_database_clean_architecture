import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/use_cases/usecase.dart';

class GetMovieUseCase implements Usecase<List<MovieEntity>, ListParams> {
  final GetMovieRepository repository;

  GetMovieUseCase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(ListParams params) async {
    return repository.getMovies(page: params.page, genreId: params.genreId);
  }
}

class ListParams extends Equatable {
  final int genreId;
  final int page;

  ListParams({required this.genreId, required this.page});

  @override
  List<Object?> get props => [genreId, page];
}
