import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:searchack/services/image_service.dart';

abstract class Paths {
  static String buildUrl(String email) {
    return 'files/$email/avatar.png';
  }
}

abstract class FirebaseStorageService {
  Future<void> setProfileImage(String email);

  Future<String?> getProfileImage(String email);
}

class FirebaseStorageServiceImpl implements FirebaseStorageService {
  var firebaseStorageInstance = FirebaseStorage.instance.ref();
  final ImageServiceImpl _imageServiceImpl = ImageServiceImpl();

  @override
  Future<String?> getProfileImage(String email) async {
    final storageRef = firebaseStorageInstance.child(Paths.buildUrl(email));
    try {
      return await storageRef.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setProfileImage(String email) async {
    final storageRef = firebaseStorageInstance.child(Paths.buildUrl(email));
    var _imagePath = await _imageServiceImpl.getImage();
    storageRef.putFile(File(_imagePath!));
  }
}
