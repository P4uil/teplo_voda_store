part of catalog_bloc;

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object?> get props => [];
}

class SelectCatalogSectionEvent extends CatalogEvent {
  final String sectionTitle;

  const SelectCatalogSectionEvent(this.sectionTitle);

  @override
  List<Object?> get props => [sectionTitle];
}

class BackToCatalogEvent extends CatalogEvent {}
