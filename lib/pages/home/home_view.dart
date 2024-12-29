import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/pages/cart/cart_view.dart';
import 'package:teplo_voda_store/pages/catalog/catalog_view.dart';
import 'package:teplo_voda_store/pages/profile/profile_view.dart';
import 'package:teplo_voda_store/pages/search/search_view.dart';
import 'package:teplo_voda_store/pages/store/store_view.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart' as bloc;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc.TabBarBloc(),
      child: Scaffold(
        body: BlocBuilder<bloc.TabBarBloc, bloc.TabBarState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedIndex,
              children: [
                _buildTabContent(0), // Главная
                _buildTabContent(1), // Каталог
                _buildTabContent(2), // Поиск
                _buildTabContent(3), // Корзина
                _buildTabContent(4), // Профиль
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<bloc.TabBarBloc, bloc.TabBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context.read<bloc.TabBarBloc>().add(bloc.SwitchTabEvent(index));
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Каталог',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Поиск',
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

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        // Главная (StoreView) без дополнительного заголовка
        return const StoreView();
      case 1:
        // Каталог (CatalogView) с заголовком
        return Scaffold(
          appBar: AppBar(
            title: const Text('Каталог'),
          ),
          body: const CatalogView(),
        );
      case 2:
        // Поиск (SearchView) с заголовком
        return Scaffold(
          appBar: AppBar(
            title: const Text('Поиск'),
          ),
          body: const SearchView(),
        );
      case 3:
        // Корзина (CartView) с заголовком
        return Scaffold(
          appBar: AppBar(
            title: const Text('Корзина'),
          ),
          body: const CartView(),
        );
      case 4:
        // Профиль (ProfileView) с заголовком
        return Scaffold(
          appBar: AppBar(
            title: const Text('Профиль'),
          ),
          body: const ProfileView(),
        );
      default:
        return const StoreView();
    }
  }
}
