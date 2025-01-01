import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/pages/catalog/bloc/catalog_bloc.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is CatalogInitial) {
          return const Center(child: Text('Выберите раздел из главного меню'));
        } else if (state is CatalogSectionSelected) {
          return Scaffold(
            appBar: AppBar(title: Text(state.sectionTitle)),
            body: Center(
              child: Text('Содержимое раздела: ${state.sectionTitle}'),
            ),
          );
        } else {
          return const Center(child: Text('Ошибка загрузки каталога'));
        }
      },
    );
  }
}
