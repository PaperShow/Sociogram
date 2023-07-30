part of 'navigation_page_bloc.dart';

abstract class NavigationPageState extends Equatable {
  final int tabIndex;
  const NavigationPageState({required this.tabIndex});

  @override
  List<Object> get props => [];
}

class NavigationPageInitial extends NavigationPageState {
  const NavigationPageInitial({required super.tabIndex});
}
