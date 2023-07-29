// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sociogram/auth/bloc/auth_bloc.dart';
// import 'package:library_love/home/database/bloc/database_bloc.dart';
import 'package:sociogram/home/screens/home.dart';
import 'package:sociogram/models/user_model.dart';

import '../../home/database/auth_data/database_bloc.dart';
import '../widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        body: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeView()));
              }

              if (state is AddingAuthData) {
                var user = FirebaseAuth.instance.currentUser;
                context.read<DatabaseBloc>().add(AddUserEvent(
                    userModel: UserModel(
                        uid: user!.uid,
                        displayName: user.displayName,
                        email: user.email)));
              }

              if (state is AuthError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UnAuthenticated) {
                return SignUpForm();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
