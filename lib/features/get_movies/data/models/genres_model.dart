import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/genres_entity.dart';

class GenresModel extends GenreEntity {
  GenresModel({required int id, required String name})
      : super(id: id, name: name);

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map["id"],
      name: map["name"],
    );
  }
}
