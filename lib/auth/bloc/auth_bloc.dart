import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sociogram/auth/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  // as in super(AuthInitial) is there but we need UnAuhtenticated at starting
  // that's why we put unauthenticated it means unauthenticated run at starting of al state
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    // sign in
    on<SingInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            emailAddress: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    //sign up
    on<SingUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            emailAddress: event.email, password: event.password);
        emit(Authenticated());
        emit(AddingAuthData());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    // google sign in
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.googleSingIn();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    // sign out
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
