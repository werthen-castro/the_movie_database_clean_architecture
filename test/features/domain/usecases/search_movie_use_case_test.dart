import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/movie_entity.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/usecases/search_movie_use_case.dart';
import 'package:the_movie_database_clean_arch/usecases/usecase.dart';

import '../../../mocks/movies_mock.dart';

class MockGetMovieRepository extends Mock implements GetMovieRepository {}

void main() {
  late Usecase useCase;
  late GetMovieRepository repository;

  setUp(() {
    repository = MockGetMovieRepository();
    useCase = SearchMovieUseCase(repository);
  });

  group('Search Movie', () {
    test('should return List<MovieEntity>', () async {
      when(() =>
          repository.searchMovie(
              page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis')).thenAnswer(
          (_) async => Right<Failure, List<MovieEntity>>(listMovieModelMock));

      final result = await useCase(
          ListParams(page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis'));

      expect(result, Right(listMovieModelMock));
    });

    test('should return a ServerFailure', () async {
      when(() => repository.searchMovie(
              page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis'))
          .thenAnswer(
              (_) async => Left<Failure, List<MovieEntity>>(ServerFailure()));

      final result = await useCase(
          ListParams(page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis'));

      expect(result, Left(ServerFailure()));
    });
  });
}
