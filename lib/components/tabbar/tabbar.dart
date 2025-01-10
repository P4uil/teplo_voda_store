import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/pages/catalog/catalog_view.dart';
import 'package:teplo_voda_store/pages/profile/profile_view.dart';
import 'package:teplo_voda_store/pages/search/search_view.dart';
import 'package:teplo_voda_store/pages/store/store_view.dart';

import '../../pages/cart/cart_view.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<SwitchTabEvent>((event, emit) {
      emit(TabBarState(selectedIndex: event.index));
    });
  }
}

class TabBarViewWidget extends StatelessWidget {
  const TabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TeploVoda'),
        ),
        body: BlocBuilder<TabBarBloc, TabBarState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedIndex,
              children: [
                const StoreView(),
                CatalogView(
                  onSectionSelected: (index) {
                    context.read<TabBarBloc>().add(SwitchTabEvent(index));
                  },
                ),
                const SearchView(),
                const CartView(),
                const ProfileView(),
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<TabBarBloc, TabBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.selectedIndex,
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
    );
  }
}
