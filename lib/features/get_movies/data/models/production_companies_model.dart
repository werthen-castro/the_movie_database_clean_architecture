import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/production_companies_entity.dart';

class ProductionCompaniesModel extends ProductionCompaniesEntity {
  ProductionCompaniesModel(
      {required int id,
      required String logoPath,
      required String name,
      required String originCountry})
      : super(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);

  factory ProductionCompaniesModel.fromMap(Map<String, dynamic> map) {
    return ProductionCompaniesModel(
      id: map["id"],
      name: map["name"],
      logoPath: map["logoPath"],
      originCountry: map["originCountry"],
    );
  }
}
