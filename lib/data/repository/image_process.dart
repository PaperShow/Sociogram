import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageProcess {
  final ImagePicker picker = ImagePicker();
  Future selectImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    if (image == null) return;
    final path = image.path;
    return File(path);
  }
}
