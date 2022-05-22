import 'package:image_picker/image_picker.dart';

abstract class ImageService {
  Future<String?> getImage();
}

class ImageServiceImpl implements ImageService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image!.path;
  }
}
