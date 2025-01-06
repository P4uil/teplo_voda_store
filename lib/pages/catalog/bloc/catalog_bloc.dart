library catalog_bloc;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

// Bloc
class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<SelectCatalogSectionEvent>((event, emit) {
      if (event.sectionTitle == 'Канализация') {
        emit(CatalogSectionContent(
            event.sectionTitle)); // Переход в раздел "Канализация"
      } else {
        emit(CatalogSectionSelected(
            event.sectionTitle)); // Для остальных разделов
      }
    });

    on<BackToCatalogEvent>((event, emit) {
      emit(CatalogInitial()); // Возврат к каталогу
    });
  }
}
