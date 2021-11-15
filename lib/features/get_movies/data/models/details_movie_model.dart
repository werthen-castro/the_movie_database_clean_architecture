import 'package:the_movie_database_clean_arch/features/get_movies/data/models/production_companies_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';

import 'genres_model.dart';

class DethailsMovieModel extends DetailsMovieEntity {
  DethailsMovieModel(
      {required int budget,
      required List<GenresModel> genres,
      required int id,
      required String originalTitle,
      required String overview,
      required String posterPath,
      required List<ProductionCompaniesModel> productionCompanies,
      required String releaseDate,
      required String status,
      required String tagline,
      required String title,
      required double voteAverage})
      : super(
            budget: budget,
            genres: genres,
            id: id,
            originalTitle: originalTitle,
            overview: overview,
            posterPath: posterPath,
            productionCompanies: productionCompanies,
            releaseDate: releaseDate,
            status: status,
            tagline: tagline,
            title: title,
            voteAverage: voteAverage);

  factory DethailsMovieModel.fromMap(Map<String, dynamic> map) {
    return DethailsMovieModel(
      id: map["id"],
      budget: map["budget"],
      genres: List<GenresModel>.from(
          map['genres'].map((model) => GenresModel.fromMap(model))),
      title: map["title"],
      title: map["title"],
      title: map["title"],
      title: map["title"],
      title: map["title"],
      title: map["title"],
      title: map["title"],
    );
  }
}
