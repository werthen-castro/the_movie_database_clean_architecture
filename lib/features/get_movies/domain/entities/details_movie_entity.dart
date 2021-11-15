import 'package:equatable/equatable.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/genre_model.dart';
import 'package:the_movie_database_clean_arch/features/get_movies/data/models/production_companies_model.dart';

class DetailsMovieEntity extends Equatable {
  int id;
  int budget;
  List<GenreModel> genres;
  String originalTitle;
  String overview;
  String posterPath;
  List<ProductionCompaniesModel> productionCompanies;
  String releaseDate;
  String status;
  String tagline;
  String title;
  double voteAverage;

  DetailsMovieEntity(
      {required this.id,
      required this.budget,
      required this.genres,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.productionCompanies,
      required this.releaseDate,
      required this.status,
      required this.tagline,
      required this.title,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        id,
        budget,
        genres,
        originalTitle,
        overview,
        posterPath,
        productionCompanies,
        releaseDate,
        status,
        tagline,
        title,
        voteAverage
      ];
}
