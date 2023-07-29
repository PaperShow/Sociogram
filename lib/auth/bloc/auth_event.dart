part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SingInRequested extends AuthEvent {
  final String email;
  final String password;
  const SingInRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SingUpRequested extends AuthEvent {
  final String email;
  final String password;
  const SingUpRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class GoogleSignInRequested extends AuthEvent {}

class SignOutRequested extends AuthEvent {}
