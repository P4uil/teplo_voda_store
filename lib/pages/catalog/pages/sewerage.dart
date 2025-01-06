import 'package:flutter/material.dart';

class SewerageView extends StatelessWidget {
  const SewerageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Возврат в каталог
            Navigator.pop(context);
          },
        ),
        title: const Text('Канализация'),
      ),
      body: const Center(
        child: Text('Содержимое раздела Канализация'),
      ),
    );
  }
}
