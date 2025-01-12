import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';

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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey[200],
        ),
        child: BlocBuilder<TabBarBloc, TabBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              currentIndex: state.selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                context.read<TabBarBloc>().add(SwitchTabEvent(index));
                Navigator.pop(context); // Navigate back to the main tab view
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Магазин',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Корзина',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Профиль',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
