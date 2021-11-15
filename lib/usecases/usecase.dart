import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_database_clean_arch/core/erros/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class ListParams extends Equatable {
  final int? genreId;
  final int? page;
  final String? name;
  final int? id;

  ListParams({this.genreId, this.page, this.name, this.id});

  @override
  List<Object?> get props => [genreId, page, name];
}
