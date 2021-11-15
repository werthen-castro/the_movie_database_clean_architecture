import 'package:dartz/dartz.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/usecases/usecase.dart';

class GetMovieForIdUseCase implements Usecase<DetailsMovieEntity, ListParams> {
  final GetMovieRepository repository;

  GetMovieForIdUseCase(this.repository);

  @override
  Future<Either<Failure, DetailsMovieEntity>> call(ListParams params) async {
    return repository.getMovieForId(id: params.id!);
  }
}
