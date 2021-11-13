import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final List<dynamic> genreIds;
  final int id;
  final String title;

  const MovieEntity({
    required this.posterPath,
    required this.genreIds,
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [posterPath, genreIds, id, title];
}
