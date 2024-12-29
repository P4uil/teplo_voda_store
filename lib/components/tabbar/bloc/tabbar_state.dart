part of 'tabbar_bloc.dart';

class TabBarState {
  final int selectedIndex; // Текущий индекс активной вкладки

  TabBarState({required this.selectedIndex});
}

/// Начальное состояние TabBar
class TabBarInitial extends TabBarState {
  TabBarInitial()
      : super(selectedIndex: 0); // По умолчанию активна первая вкладка
}
