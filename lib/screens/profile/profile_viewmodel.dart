import 'package:flutter/material.dart';
import 'package:searchack/services/firebase_firestore_service.dart';
import 'package:searchack/services/firebase_storage_service.dart';

class ProfileViewModel with ChangeNotifier {
  String? description;
  List<String>? keySkills;
  List<String>? vkLink;
  String? avatarLink;

  FirebaseStorageServiceImpl firebaseStorageService =
      FirebaseStorageServiceImpl();

  Future<void> init(
      {required FirebaseFirestoreService db, required String userEmail}) async {
    await getDescriptionData(db: db, userEmail: userEmail);
    await getProfileImage();
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
      print(e);
    }
  }

  Future<void> setProfileImage() async {
    await firebaseStorageService.setProfileImage();
  }

  Future<void> getProfileImage() async {
    avatarLink = await firebaseStorageService.getProfileImage();
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
    //TODO add error handling and field update
    await db.setArrayDataForCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.keySkills,
      list: list,
    );
  }

  Future<void> getVkLinkData(
      {required FirebaseFirestoreService db, required String userEmail}) async {
    vkLink = (await db.getDataFromCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.vkLink,
      key: DataBaseCollectionKeys.text,
    ));
    notifyListeners();
  }

  Future<void> setDescriptionData({
    required FirebaseFirestoreService db,
    required String userEmail,
    required String text,
  }) async {
    //TODO add error handling and field update
    await db.setDataForCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.descriptionCollection,
      text: text,
    );
  }

  Future<void> setVkLinkData({
    required FirebaseFirestoreService db,
    required String userEmail,
    required String link,
  }) async {
    //TODO add error handling and field update
    await db.setDataForCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.vkLink,
      text: link,
    );
  }
}
