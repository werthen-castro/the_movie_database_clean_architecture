import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/production_companies_entity.dart';

class ProductionCompaniesModel extends ProductionCompaniesEntity {
  ProductionCompaniesModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory ProductionCompaniesModel.fromMap(Map<String, dynamic> map) {
    return ProductionCompaniesModel(
      id: map["id"],
      name: map["name"],
    );
  }
}
