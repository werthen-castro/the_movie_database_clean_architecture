import 'package:equatable/equatable.dart';

class ProductionCompaniesEntity extends Equatable {
  int id;
  String name;

  ProductionCompaniesEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
