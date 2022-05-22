import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:searchack/services/image_service.dart';

abstract class Paths {
  static const String imagePathOnFirebase = 'files/avatar.png';
}

abstract class FirebaseStorageService {
  Future<void> setProfileImage();

  Future<String> getProfileImage();
}

class FirebaseStorageServiceImpl implements FirebaseStorageService {
  var firebaseStorageInstance = FirebaseStorage.instance.ref();
  final ImageServiceImpl _imageServiceImpl = ImageServiceImpl();

  @override
  Future<String> getProfileImage() async {
    final storageRef = firebaseStorageInstance.child(Paths.imagePathOnFirebase);
    return await storageRef.getDownloadURL();
  }

  @override
  Future<void> setProfileImage() async {
    final storageRef = firebaseStorageInstance.child(Paths.imagePathOnFirebase);
    var _imagePath = await _imageServiceImpl.getImage();
    storageRef.putFile(File(_imagePath!));
  }
}
