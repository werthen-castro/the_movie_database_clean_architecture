import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/get_movie_for_id_use_case.dart';
import 'package:the_movie_database_clean_arch/usecases/usecase.dart';

import '../../../mocks/movies_mock.dart';

class MockGetMovieRepository extends Mock implements GetMovieRepository {}

void main() {
  late Usecase useCase;
  late GetMovieRepository repository;

  setUp(() {
    repository = MockGetMovieRepository();
    useCase = GetMovieForIdUseCase(repository);
  });

  group('Get Movie For Id', () {
    test('should return DetailsMovieEntity', () async {
      when(() => repository.getMovieForId(id: 566525)).thenAnswer((_) async =>
          Right<Failure, DetailsMovieEntity>(mockeDethailsMovieModel));

      final result = await useCase(ListParams(id: 566525));

      expect(result, Right(mockeDethailsMovieModel));
    });

    test('should return a ServerFailure', () async {
      when(() => repository.getMovieForId(id: 566525)).thenAnswer(
          (_) async => Left<Failure, DetailsMovieEntity>(ServerFailure()));

      final result = await useCase(ListParams(id: 566525));

      expect(result, Left(ServerFailure()));
    });
  });
}
