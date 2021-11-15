import 'package:flutter_test/flutter_test.dart';

import 'package:the_movie_database_clean_arch/features/get_movies/data/models/production_companies_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/production_companies_entity.dart';
import 'dart:convert';

import '../../../mocks/movies_mock.dart';

void main() {
  test('should be a subclass of ProductionCompaniesEntity', () {
    expect(productionCompaniesModel, isA<ProductionCompaniesEntity>());
  });

  test('should return a valid model', () {
    // Arrange
    final Map<String, dynamic> jsonMap =
        json.decode(mockProductionCompanieJson);

    // act
    final result = ProductionCompaniesModel.fromMap(jsonMap);

    // Assert
    expect(result, productionCompaniesModel);
  });
}
