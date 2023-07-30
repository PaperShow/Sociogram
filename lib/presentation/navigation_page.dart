import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sociogram/data/bloc/navigation_page/navigation_page_bloc.dart';
import 'package:sociogram/home/screens/home.dart';

List<BottomNavigationBarItem> bottomNavItems = const [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: 'Extra'),
  BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'Search'),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
];

const List<Widget> bottomNavScreen = [
  // HomeView(),
  Text('asdf'),
  Text('rtyu'),
  Text('pqrs'),
  Text('zxcv'),
];

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationPageBloc, NavigationPageState>(
      listener: (context, state) {
        // print(state.tabIndex);
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomNavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<NavigationPageBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
