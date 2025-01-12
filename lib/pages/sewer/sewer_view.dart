import 'package:flutter/material.dart';

class SewerView extends StatelessWidget {
  const SewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Канализация'),
      ),
      body: Center(
        child: const Text('This is the Канализация page'),
      ),
    );
  }
}
