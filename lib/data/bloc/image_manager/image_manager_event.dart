part of 'image_manager_bloc.dart';

abstract class ImageManagerEvent extends Equatable {
  const ImageManagerEvent();

  @override
  List<Object> get props => [];
}

class ImageSelectionEvent extends ImageManagerEvent {
  final ImageSource source;
  const ImageSelectionEvent({
    required this.source,
  });

  @override
  List<Object> get props => [source];
}
