import 'package:dartz/dartz.dart';
import 'package:the_movie_database_clean_arch/core/erros/custom_server_exceptions.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';

class GetMovieRepositoryImpl implements GetMovieRepository {
  final GetMoviesDataSource dataSource;

  GetMovieRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies(
      {required int page, required int genreId}) async {
    try {
      final result = await dataSource.getMovies(page: page, genereId: genreId);
      return Right(result);
    } on CustomServerException catch (e) {
      return Left(ServerFailure(errorMessage: e.messageError));
    }
  }
}
