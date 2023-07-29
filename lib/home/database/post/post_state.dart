part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostAdding extends PostState {}

class PostAdded extends PostState {}

class PostUpdating extends PostState {}

class PostUpdated extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> posts;
  const PostLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class PostError extends PostState {
  final String message;
  const PostError({required this.message});

  @override
  List<Object> get props => [message];
}
