library tabbar_bloc;

import 'package:bloc/bloc.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

/// Bloc для управления состоянием TabBar
class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<SwitchTabEvent>((event, emit) {
      // Переключение на выбранный индекс
      emit(TabBarState(selectedIndex: event.index));
    });
  }
}
