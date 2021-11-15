import 'package:the_movie_database_clean_arch/features/get_movies/domain/entities/genres_entity.dart';

class GenreModel extends GenreEntity {
  GenreModel({required int id, required String name})
      : super(id: id, name: name);

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map["id"],
      name: map["name"],
    );
  }
}
