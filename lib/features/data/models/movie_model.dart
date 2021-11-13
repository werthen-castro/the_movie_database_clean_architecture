import 'package:the_movie_database_clean_arch/features/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required String posterPath,
    required List<dynamic> genreIds,
    required int id,
    required String title,
  }) : super(
          posterPath: posterPath,
          genreIds: genreIds,
          id: id,
          title: title,
        );

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
        posterPath: map["poster_path"],
        id: map["id"],
        title: map["title"],
        genreIds: map['genre_ids']);
  }
}
