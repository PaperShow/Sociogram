part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends DatabaseEvent {
  const AddUserEvent({required this.userModel});

  final UserModel userModel;
  @override
  List<Object> get props => [userModel];
}

class DatabaseFetched extends DatabaseEvent {}
