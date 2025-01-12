import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/tabbar.dart';
import 'package:teplo_voda_store/pages/cart/cart_view.dart';

class SewerView extends StatelessWidget {
  const SewerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Канализация'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartView()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: const Text('This is the Канализация page'),
      ),
    );
  }
}
