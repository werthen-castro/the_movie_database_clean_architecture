class ProductionCompaniesEntity {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompaniesEntity(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry});

  @override
  List<Object?> get props => [id, name, logoPath, originCountry];
}
