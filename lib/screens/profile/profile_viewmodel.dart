import 'package:flutter/material.dart';
import 'package:searchack/services/db_service.dart';

class ProfileViewModel with ChangeNotifier {
  String? description;
  List<String>? keySkills;
  List<String>? vkLink;

  Future<void> getDescriptionData(
      {required DataBaseService db, required String userEmail}) async {
    description = (await db.getDataFromCollection(
      userEmail: userEmail,
      collectionName: DataBaseCollectionNames.descriptionCollection,
      key: DataBaseCollectionKeys.documentId,
    ))!
        .first;
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
}
