import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sociogram/models/post_model.dart';

import '../post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  PostBloc({required this.repository}) : super(PostInitial()) {
    // on<PostEvent>();
    on<PostAddEvent>(_addPost);
    on<PostUpdateEvent>(_updatePost);
  }

  _addPost(PostAddEvent event, Emitter<PostState> emit) async {
    await repository.addPost(event.post);
  }

  _updatePost(PostUpdateEvent event, Emitter<PostState> emit) async {
    await repository.updatePost(event.post);
  }

  _retrieveAllPost(PostFetched event, Emitter<PostState> emit) async {
    await repository.retrievePost();
  }
}
