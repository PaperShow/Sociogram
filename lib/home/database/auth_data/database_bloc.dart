import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sociogram/home/database/user_rep.dart';

import '../../../data/model/user_model.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final UserRepository dataRepository;
  DatabaseBloc({required this.dataRepository}) : super(DatabaseInitial()) {
    on<DatabaseFetched>(_fetchUserData);
    on<AddUserEvent>(_addUserData);
  }

  _addUserData(AddUserEvent event, Emitter<DatabaseState> emit) async {
    await dataRepository.addUserData(event.userModel);
    emit(UserAddSuccess());
  }

  _fetchUserData(DatabaseFetched event, Emitter<DatabaseState> emit) async {
    List<UserModel> userList = await dataRepository.retrieveUserData();
    emit(DatabaseSuccess(userList: userList));
  }
}
