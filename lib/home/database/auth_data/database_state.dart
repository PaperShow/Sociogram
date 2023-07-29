part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseSuccess extends DatabaseState {
  final List<UserModel> userList;
  const DatabaseSuccess({required this.userList});

  @override
  List<Object> get props => [];
}

class UserAddSuccess extends DatabaseState {}

class DatabaseError extends DatabaseState {
  @override
  List<Object> get props => [];
}
