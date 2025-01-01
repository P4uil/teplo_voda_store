part of 'catalog_bloc.dart';

sealed class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

final class SelectCatalogSectionEvent extends CatalogEvent {
  final String sectionTitle;

  const SelectCatalogSectionEvent(this.sectionTitle);

  @override
  List<Object> get props => [sectionTitle];
}
