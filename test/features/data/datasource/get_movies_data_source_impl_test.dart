import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_database_clean_arch/core/dio_client/dio_client.dart';
import 'package:the_movie_database_clean_arch/core/dio_client/dio_response.dart';
import 'package:the_movie_database_clean_arch/core/erros/custom_server_exceptions.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/datasource/get_movies_data_source_impl.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/movie_model.dart';

import '../../../mocks/movies_mock.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  late GetMoviesDataSource datasource;
  late DioClient dioClient;
  const String urlExpected =
      "https://api.themoviedb.org/3/discover/movie?api_key=7894d961381ee2193e4a6cd702d59e62&with_genres=28&page=1&language=pt-BR";

  setUp(() {
    dioClient = MockDioClient();
    datasource = GetMoviesDataSourceImpl(dioClient);
  });

  void sucessMock() {
    when(() => dioClient.get(any())).thenAnswer((_) async =>
        DioResponse(data: json.decode(listMoviesMock), statusCode: 200));
  }

  test('should call the get method with correct url', () async {
    // Arrange
    sucessMock();

    // Act
    await datasource.getMovies(page: 1, genereId: 28);

    // Assert
    verify(() => dioClient.get(urlExpected)).called(1);
  });

  test('should return a List<MovieModel> when a sucessfull', () async {
    // Arrange
    sucessMock();

    // Act
    List<MovieModel> result = await datasource.getMovies(page: 1, genereId: 28);

    // Assert
    expect(result, listMovieModelMock);
  });

  test("should throw a CustomServerException when is uncessful, Unauthorized",
      () async {
    // Arrange
    when(() => dioClient.get(any())).thenAnswer((_) async => DioResponse(
        statusMessage: 'Invalid API key: You must be granted a valid key',
        statusCode: 401));

    // act
    var result = datasource.getMovies(page: 1, genereId: 28);

    // Assert
    expect(
        () => result,
        throwsA(predicate((e) =>
            e is CustomServerException &&
            e.messageError ==
                'Invalid API key: You must be granted a valid key')));
  });

  test("should throw a CustomServerException when is uncessful, Not Found",
      () async {
    // Arrange
    when(() => dioClient.get(any())).thenAnswer((_) async => DioResponse(
        statusMessage: 'The resource you requested could not be found.',
        statusCode: 404));

    // act
    var result = datasource.getMovies(page: 1, genereId: 28);

    // Assert
    expect(
        () => result,
        throwsA(predicate((e) =>
            e is CustomServerException &&
            e.messageError ==
                'The resource you requested could not be found.')));
  });
}
