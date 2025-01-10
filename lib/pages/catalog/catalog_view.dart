import 'package:flutter/material.dart';

class CatalogView extends StatelessWidget {
  final Function(int) onSectionSelected;

  const CatalogView({super.key, required this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 1, // Укажите количество элементов списка
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              tileColor: Colors.grey[200],
              title: const Text(
                'Канализация',
                style: TextStyle(fontSize: 16),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                onSectionSelected(5); // Переход к экрану "Канализация"
              },
            ),
          );
        },
      ),
    );
  }
}
