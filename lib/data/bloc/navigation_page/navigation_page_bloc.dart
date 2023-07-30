import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_page_event.dart';
part 'navigation_page_state.dart';

class NavigationPageBloc
    extends Bloc<NavigationPageEvent, NavigationPageState> {
  NavigationPageBloc() : super(const NavigationPageInitial(tabIndex: 0)) {
    on<NavigationPageEvent>((event, emit) {
      if (event is TabChange) {
        emit(NavigationPageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
