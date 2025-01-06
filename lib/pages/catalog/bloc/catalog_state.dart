part of catalog_bloc;

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object?> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogSectionSelected extends CatalogState {
  final String sectionTitle;

  const CatalogSectionSelected(this.sectionTitle);

  @override
  List<Object?> get props => [sectionTitle];
}

class CatalogSectionContent extends CatalogState {
  final String sectionTitle;

  const CatalogSectionContent(this.sectionTitle);

  @override
  List<Object?> get props => [sectionTitle];
}
