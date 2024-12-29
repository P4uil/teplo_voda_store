part of 'tabbar_bloc.dart';

abstract class TabBarEvent {}

/// Событие переключения вкладки
class SwitchTabEvent extends TabBarEvent {
  final int index; // Индекс выбранной вкладки

  SwitchTabEvent(this.index);
}
