import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teplo_voda_store/components/tabbar/bloc/tabbar_bloc.dart';
import 'package:teplo_voda_store/pages/profile/profile_view.dart';
import 'package:teplo_voda_store/pages/store/store_view.dart';
import '../../pages/cart/cart_view.dart';

class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({super.key});

  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarBloc(),
      child: Scaffold(
        body: BlocListener<TabBarBloc, TabBarState>(
          listener: (context, state) {
            _pageController.jumpToPage(state.selectedIndex);
          },
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(), // Отключить свайпы
            children: const [
              StoreView(),
              CartView(),
              ProfileView(),
            ],
          ),
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
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Главная',
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
