import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sociogram/data/bloc/navigation_page/navigation_page_bloc.dart';
import 'package:sociogram/presentation/navigation_page.dart';

import '../auth/screens/signup.view.dart';

class RouteGenerator {
  final NavigationPageBloc navigationPageBloc = NavigationPageBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments; // for passing argument if there any parameter
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<NavigationPageBloc>.value(
                  value: navigationPageBloc,
                  child: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return const NavigationPage();
                        }
                        return const SignUpView();
                      }),
                ));
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
