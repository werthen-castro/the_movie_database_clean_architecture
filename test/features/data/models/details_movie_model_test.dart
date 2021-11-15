import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/details_movie_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';
import 'dart:convert';

import '../../../mocks/movies_mock.dart';

void main() {
  test('should be a subclass of GenreEntity', () {
    expect(mockeDethailsMovieModel, isA<DetailsMovieEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap = json.decode(mockDetailsMovie);

    // act
    final result = DetailsMovieModel.fromMap(jsonMap);

    // Assert
    expect(result, mockeDethailsMovieModel);
  });
}
