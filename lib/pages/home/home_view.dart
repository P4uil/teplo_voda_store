import 'package:flutter/material.dart';
import 'package:teplo_voda_store/pages/catalog/catalog_view.dart';
import 'package:teplo_voda_store/pages/cart/cart_view.dart';
import 'package:teplo_voda_store/pages/catalog/pages/sewerage.dart';
import 'package:teplo_voda_store/pages/profile/profile_view.dart';
import 'package:teplo_voda_store/pages/search/search_view.dart';
import 'package:teplo_voda_store/pages/store/store_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  void _onSectionSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const StoreView(), // Главная
          CatalogView(onSectionSelected: _onSectionSelected), // Каталог
          const SearchView(), // Поиск
          const CartView(), // Корзина
          const ProfileView(), // Профиль
          Scaffold(
            appBar: AppBar(
              title: const Text('Канализация'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _onSectionSelected(1); // Вернуться к каталогу
                },
              ),
            ),
            body: const SewerageView(), // Экран "Канализация"
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex < 5
            ? _currentIndex
            : 1, // "Канализация" относится к "Каталогу"
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Каталог'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Корзина'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
