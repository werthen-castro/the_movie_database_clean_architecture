import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_database_clean_arch/features/data/models/movie_model.dart';
import 'dart:convert';

import 'package:the_movie_database_clean_arch/features/domain/entities/movie_entity.dart';

import '../../../mocks/movies_mock.dart';

void main() {
  test('should be a subclass of MovieEntity', () {
    expect(movieModelMock, isA<MovieEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(movieModelJsonMock);

    // act
    final result = MovieModel.fromMap(jsonMap);

    // Assert
    expect(result, movieModelMock);
  });
}
