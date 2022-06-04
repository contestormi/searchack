import 'package:flutter/material.dart';
import 'package:searchack/services/firebase_firestore_service.dart';
import 'package:searchack/services/firebase_storage_service.dart';

class ProfileViewModel with ChangeNotifier {
  String? description;
  List<String>? keySkills;
  String? avatarLink;

  FirebaseStorageServiceImpl firebaseStorageService =
      FirebaseStorageServiceImpl();

  Future<void> init(
      {required FirebaseFirestoreService db, required String userEmail}) async {
    await getDescriptionData(db: db, userEmail: userEmail);
    await getProfileImage(userEmail);
    await getKeySkillsData(db: db, userEmail: userEmail);
  }

  Future<void> getDescriptionData(
      {required FirebaseFirestoreService db, required String userEmail}) async {
    try {
      description = (await db.getDataFromCollection(
        userEmail: userEmail,
        collectionName: DataBaseCollectionNames.descriptionCollection,
        key: DataBaseCollectionKeys.text,
      ))!
          .first;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setDescriptionData({
    required FirebaseFirestoreService db,
    required String userEmail,
    required String text,
  }) async {
    await db.setDataForCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.descriptionCollection,
      text: text,
    );
  }

  Future<void> setProfileImage(String userEmail) async {
    await firebaseStorageService.setProfileImage(userEmail);
  }

  Future<void> getProfileImage(String userEmail) async {
    avatarLink = await firebaseStorageService.getProfileImage(userEmail);
    notifyListeners();
  }

  Future<void> getKeySkillsData(
      {required FirebaseFirestoreService db, required String userEmail}) async {
    keySkills = (await db.getArrayDataFromCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.keySkills,
      key: DataBaseCollectionKeys.text,
    ));
    notifyListeners();
  }

  Future<void> setKeySkillsData({
    required FirebaseFirestoreService db,
    required String userEmail,
    required List<String> list,
  }) async {
    await db.setArrayDataForCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.keySkills,
      list: list,
    );
  }
}
