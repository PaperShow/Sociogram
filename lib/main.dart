import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sociogram/auth/auth_repo.dart';
import 'package:sociogram/auth/bloc/auth_bloc.dart';
import 'package:sociogram/auth/screens/signup.view.dart';
import 'package:sociogram/firebase_options.dart';
import 'package:sociogram/home/database/post/post_bloc.dart';
import 'package:sociogram/home/database/post_repo.dart';
import 'package:sociogram/home/database/user_rep.dart';
import 'package:sociogram/home/screens/home.dart';

import 'home/database/auth_data/database_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => PostRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          ),
          BlocProvider(
            create: (context) => DatabaseBloc(
                dataRepository: RepositoryProvider.of<UserRepository>(context)),
          ),
          BlocProvider(
            create: (context) => PostBloc(
                repository: RepositoryProvider.of<PostRepository>(context)),
          ),
        ],
        child: ScreenUtilInit(builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark(
              useMaterial3: true,
            ),
            home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomeView();
                  }
                  return SignUpView();
                }),
          );
        }),
      ),
    );
  }
}
