import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sociogram/auth/bloc/auth_bloc.dart';
import 'package:sociogram/auth/screens/signup.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final currentUser = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SignUpView()),
                  (route) => false);
            }
          },
          // to show the home view
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text('Sociogram'),
                    const Spacer(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 94, 94, 94),
                          Color.fromARGB(96, 59, 59, 59)
                        ]),
                      ),
                      child: const Text('150'),
                    ),
                    SizedBox(width: 20.w),
                    Container(
                      // child: Image.network(),
                      height: 43.h,
                      width: 43.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              //post
              Container(
                height: 250.h,
                color: Colors.amber,
              ),
              Row(
                children: [
                  Icon(Icons.favorite),
                  Text('12k'),
                  SizedBox(width: 10.w),
                  Icon(Icons.comment_rounded),
                  Text('250'),
                  Spacer(),
                  Icon(Icons.bookmark),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                  ),
                  SizedBox(width: 5.w),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: 'Username  ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "Use 'const' with the constructor to improve performance.Try adding the 'const' keyword to the constructor invocation."),
                      ]),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
