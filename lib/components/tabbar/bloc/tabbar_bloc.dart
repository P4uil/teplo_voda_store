library tabbar_bloc;

import 'package:bloc/bloc.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

/// Bloc для управления состоянием TabBar
class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<SwitchTabEvent>((event, emit) {
      print('SwitchTabEvent received: ${event.index}');
      emit(TabBarState(selectedIndex: event.index));
      print('TabBarState updated: ${state.selectedIndex}');
    });
  }
}

