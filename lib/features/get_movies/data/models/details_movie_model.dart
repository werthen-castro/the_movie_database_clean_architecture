import 'package:the_movie_database_clean_arch/features/get_movies/data/models/production_companies_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/details_movie_entity.dart';

import 'genre_model.dart';

class DetailsMovieModel extends DetailsMovieEntity {
  DetailsMovieModel(
      {required int budget,
      required List<GenreModel> genres,
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

  factory DetailsMovieModel.fromMap(Map<String, dynamic> map) {
    return DetailsMovieModel(
      id: map["id"],
      budget: map["budget"],
      genres: List<GenreModel>.from(
          map['genres'].map((model) => GenreModel.fromMap(model))),
      originalTitle: map["original_title"],
      overview: map["overview"],
      posterPath: map["poster_path"],
      productionCompanies: List<ProductionCompaniesModel>.from(
          map['production_companies']
              .map((model) => ProductionCompaniesModel.fromMap(model))),
      releaseDate: map["release_date"],
      status: map["status"],
      tagline: map["tagline"],
      title: map["title"],
      voteAverage: map["vote_average"],
    );
  }
}
