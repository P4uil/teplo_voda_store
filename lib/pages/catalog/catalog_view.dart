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
          return Scaffold(
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: const Text('Канализация'),
                  onTap: () {
                    context
                        .read<CatalogBloc>()
                        .add(SelectCatalogSectionEvent('Канализация'));
                  },
                ),
                ListTile(
                  title: const Text('Задвижки'),
                  onTap: () {
                    context
                        .read<CatalogBloc>()
                        .add(SelectCatalogSectionEvent('Задвижки'));
                  },
                ),
                // Добавьте остальные разделы...
              ],
            ),
          );
        } else if (state is CatalogSectionContent) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.read<CatalogBloc>().add(BackToCatalogEvent());
                },
              ),
              title: Text(state.sectionTitle),
            ),
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
