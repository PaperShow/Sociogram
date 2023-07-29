part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostAddEvent extends PostEvent {
  const PostAddEvent({required this.post});
  final PostModel post;

  @override
  List<Object> get props => [post];
}

class PostUpdateEvent extends PostEvent {
  const PostUpdateEvent({required this.post});
  final PostModel post;

  @override
  List<Object> get props => [post];
}

class PostFetched extends PostEvent {}
