part of 'image_manager_bloc.dart';

abstract class ImageManagerState extends Equatable {
  const ImageManagerState();

  @override
  List<Object> get props => [];
}

class ImageManagerInitial extends ImageManagerState {}

class ImageSelected extends ImageManagerState {}
