part of 'navigation_page_bloc.dart';

abstract class NavigationPageEvent extends Equatable {
  const NavigationPageEvent();

  @override
  List<Object> get props => [];
}

class TabChange extends NavigationPageEvent {
  final int tabIndex;
  const TabChange({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}
