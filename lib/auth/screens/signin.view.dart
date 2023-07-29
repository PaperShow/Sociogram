import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sociogram/auth/bloc/auth_bloc.dart';
import 'package:sociogram/auth/widgets/signin_form.dart';
import 'package:sociogram/home/screens/home.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                return SignInForm();
              }
              return Container(); //initial state is unauthenticated
            },
          ),
        ),
      ),
    );
  }
}
