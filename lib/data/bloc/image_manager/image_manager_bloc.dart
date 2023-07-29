import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sociogram/data/repository/image_process.dart';

part 'image_manager_event.dart';
part 'image_manager_state.dart';

class ImageManagerBloc extends Bloc<ImageManagerEvent, ImageManagerState> {
  final ImageProcess imageProcess;
  ImageManagerBloc({required this.imageProcess})
      : super(ImageManagerInitial()) {}

  // _selectImage(ImageSelectionEvent event, Emitter<ImageManagerState> emit) async{
  //   final file = await imageProcess.selectImage(event.source);

  //   if(file==null) emit
  // }
}
