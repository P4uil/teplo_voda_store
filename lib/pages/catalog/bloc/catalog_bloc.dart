library catalog_bloc;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

// Bloc
class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<SelectCatalogSectionEvent>((event, emit) {
      emit(CatalogSectionSelected(event.sectionTitle)); // Переход в раздел
    });

    on<BackToCatalogEvent>((event, emit) {
      emit(CatalogInitial()); // Возврат в каталог
    });
  }
}
