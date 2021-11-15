import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/genre_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/genres_entity.dart';
import 'dart:convert';

import '../../../mocks/movies_mock.dart';

void main() {
  test('should be a subclass of GenreEntity', () {
    expect(mockGenreModel, isA<GenreEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(mockGenreJson);

    // act
    final result = GenreModel.fromMap(jsonMap);

    // Assert
    expect(result, mockGenreModel);
  });
}
