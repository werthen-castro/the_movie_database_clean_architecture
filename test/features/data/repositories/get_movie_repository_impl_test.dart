import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_database_clean_arch/core/erros/custom_server_exceptions.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/repositories/get_movie_repository_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/repositories/get_movie_repository.dart';

import '../../../mocks/movies_mock.dart';

class MockGetMoviesDataSource extends Mock implements GetMoviesDataSource {}

void main() {
  late GetMovieRepository repository;
  late GetMoviesDataSource dataSource;

  setUp(() {
    dataSource = MockGetMoviesDataSource();
    repository = GetMovieRepositoryImpl(dataSource);
  });

  group('getMovies', () {
    test('should return  List<MovieModel> of the datasource', () async {
      // Arrange
      when(() => dataSource.getMovies(page: 1, genereId: 28))
          .thenAnswer((_) async => listMovieModelMock);

      // act
      final result = await repository.getMovies(page: 1, genreId: 28);

      // Assert
      expect(result, Right(listMovieModelMock));
    });

    test(
        'should return a server failure when call to datasource is unsecessful ( CustomServerException )',
        () async {
      // Arrange
      when(() => dataSource.getMovies(page: 1, genereId: 28))
          .thenThrow(CustomServerException());

      // Act
      final result = await repository.getMovies(page: 1, genreId: 28);

      //Assert
      expect(result, Left(ServerFailure()));
    });
  });

  group('Get Movie For Id - ', () {
    test('should return DetailsMovieModel of the datasource', () async {
      // Arrange
      when(() => dataSource.getMovieForId(id: 566525))
          .thenAnswer((_) async => mockeDethailsMovieModel);

      // act
      final result = await repository.getMovieForId(id: 566525);

      // Assert
      expect(result, Right(mockeDethailsMovieModel));
    });

    test(
        'should return a server failure when call to datasource is unsecessful ( CustomServerException )',
        () async {
      // Arrange
      when(() => dataSource.getMovieForId(id: 566525))
          .thenThrow(CustomServerException());

      // Act
      final result = await repository.getMovieForId(id: 566525);

      //Assert
      expect(result, Left(ServerFailure()));
    });
  });

  group('Search Movie', () {
    test('should return  List<MovieModel> of the datasource', () async {
      // Arrange
      when(() => dataSource.searchMovie(
              page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis'))
          .thenAnswer((_) async => listMovieModelMock);

      // act
      final result = await repository.searchMovie(
          page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis');

      // Assert
      expect(result, Right(listMovieModelMock));
    });

    test(
        'should return a server failure when call to datasource is unsecessful ( CustomServerException )',
        () async {
      // Arrange
      when(() => dataSource.searchMovie(
              page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis'))
          .thenThrow(CustomServerException());

      // Act
      final result = await repository.searchMovie(
          page: 1, name: 'Shang-Chi e a Lenda dos Dez Anéis');

      //Assert
      expect(result, Left(ServerFailure()));
    });
  });
}
