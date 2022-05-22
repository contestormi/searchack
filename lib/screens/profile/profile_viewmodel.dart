import 'package:flutter/material.dart';
import 'package:searchack/services/db_service.dart';

class ProfileViewModel with ChangeNotifier {
  String? description;
  List<String>? keySkills;
  List<String>? vkLink;

  Future<void> init(
      {required DataBaseService db, required String userEmail}) async {
    await getDescriptionData(db: db, userEmail: userEmail);
    await getKeySkillsData(db: db, userEmail: userEmail);
  }

  Future<void> getDescriptionData(
      {required DataBaseService db, required String userEmail}) async {
    description = (await db.getDataFromCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.descriptionCollection,
      key: DataBaseCollectionKeys.text,
    ))!
        .first;
    notifyListeners();
  }

  Future<void> getKeySkillsData(
      {required DataBaseService db, required String userEmail}) async {
    keySkills = (await db.getDataFromCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.keySkills,
      key: DataBaseCollectionKeys.text,
    ));
    notifyListeners();
  }

  Future<void> getVkLinkData(
      {required DataBaseService db, required String userEmail}) async {
    vkLink = (await db.getDataFromCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.vkLink,
      key: DataBaseCollectionKeys.text,
    ));
    notifyListeners();
  }

  Future<void> setDescriptionData({
    required DataBaseService db,
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
    required DataBaseService db,
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
