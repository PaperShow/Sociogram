import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sociogram/auth/bloc/auth_bloc.dart';
import 'package:sociogram/auth/screens/signin.view.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
  });

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              TextButton(onPressed: () {}, child: const Text('Later'))
            ],
          ),
          SizedBox(height: 30.h),
          Text(
            'Create an account',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 40.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              controller: emailController,
              // style: TextStyle(),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: 'Email Address',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              controller: passController,
              // style: TextStyle(),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: 'Password',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 30.h),

          // Create Account button
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(SingUpRequested(
                  email: emailController.text, password: passController.text));
              // var user = FirebaseAuth.instance.currentUser;
              // context.read<DatabaseBloc>().add(AddUserEvent(
              //     userModel: UserModel(
              //         uid: user!.uid,
              //         displayName: user.displayName,
              //         email: user.email,
              //         age: "25")));
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 11.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 246, 205, 85)),
                child: Text(
                  'Create an Account',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                )),
          ),
          SizedBox(height: 25.h),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInView()));
            },
            child: Text(
              'Already have an account?',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          SizedBox(height: 35.h),
          Divider(
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: 35.h),
          GestureDetector(
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(GoogleSignInRequested());
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 11.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.import_contacts),
                    SizedBox(width: 5.w),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
