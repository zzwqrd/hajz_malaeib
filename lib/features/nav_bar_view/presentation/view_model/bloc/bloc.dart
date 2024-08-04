import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  // NavigationBloc() : super(NavigationState.initial());
  NavigationBloc() : super(NavigationState.initial()) {
    on<UpdateNavigationIndex>(_getData);
  }

  void _getData(
    NavigationEvent event,
    Emitter<NavigationState> emit,
  ) async {
    if (event is UpdateNavigationIndex) {
      emit(NavigationState(currentIndex: event.newIndex));
    }
  }

  String getTextForValue(int value) {
    switch (value) {
      case 0:
        return 'مباريات في مصر';
      case 1:
        return 'ملاعب في مصر';
      case 2:
        return 'المزيد';
      default:
        return '';
    }
  }

  // @override
  // Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
  //   if (event is UpdateNavigationIndex) {
  //     yield NavigationState(currentIndex: event.newIndex);
  //   }
  // }
}
