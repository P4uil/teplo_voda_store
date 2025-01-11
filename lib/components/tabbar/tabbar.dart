import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/pages/catalog/catalog_view.dart';
import 'package:teplo_voda_store/pages/profile/profile_view.dart';
import 'package:teplo_voda_store/pages/search/search_view.dart';
import 'package:teplo_voda_store/pages/store/store_view.dart';

import '../../pages/cart/cart_view.dart';

class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({super.key});

  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarBloc(),
      child: Scaffold(
        body: BlocListener<TabBarBloc, TabBarState>(
          listener: (context, state) {
            _tabController.index = state.selectedIndex;
          },
          child: BlocBuilder<TabBarBloc, TabBarState>(
            builder: (context, state) {
              return TabBarView(
                controller: _tabController,
                children: [
                  const StoreView(),
                  CatalogView(
                    onSectionSelected: (index) {
                      print('Section selected: $index');
                    },
                  ),
                  const SearchView(),
                  const CartView(),
                  const ProfileView(),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Theme( // Wrap with Theme
          data: Theme.of(context).copyWith( // Copy existing theme
            canvasColor: Colors.grey[200], // Set background color here
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
                },
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
      ),
    );
  }
}