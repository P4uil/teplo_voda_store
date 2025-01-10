import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          // Clear cart button
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Вы уверены что хотите очистить корзину?'),
                  actions: [
                    // Action button (Cancel)
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Отмена'),
                    ),

                    // Yes button (Clear Cart)
                    TextButton(
                      onPressed: () {
                        // Here you should add the logic to clear the cart.
                        // For example, if you are using a state management
                        // solution like Provider, BLoC, or Riverpod, you would
                        // call a method to update the cart state.

                        // Example (using a hypothetical CartProvider):
                        // context.read<CartProvider>().clearCart();

                        Navigator.pop(context); // Close the dialog
                      },
                      child: const Text('Да'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: const Center(
        // Added a body to prevent a blank screen
        child: Text('Корзина пуста'), // Placeholder text
      ),
    );
  }
}
