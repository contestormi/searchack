import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseCollectionNames {
  static const String descriptionCollection = 'description';
  static const String keySkills = 'key_skills';
  static const String vkLink = 'vk_link';
}

abstract class DataBaseCollectionKeys {
  static const String text = 'text';
  static const String documentId = '__name__';
}

abstract class FirebaseFirestoreService {
  Future<void> setDataForCollection(
      {required String collectionName,
      required String userEmail,
      required String text});

  Future<List<String>?> getDataFromCollection(
      {required String userEmail,
      required String collectionName,
      required String key});
}

class FirebaseFirestoreServiceImpl implements FirebaseFirestoreService {
  final FirebaseFirestore _db;

  FirebaseFirestoreServiceImpl(this._db);

  @override
  Future<void> setDataForCollection(
      {required String collectionName,
      required String userEmail,
      required String text}) async {
    await _db.collection(collectionName).doc(userEmail).set(
      {DataBaseCollectionKeys.text: text},
    );
  }

  @override
  Future<List<String>?> getDataFromCollection(
      {required String userEmail,
      required String collectionName,
      required String key}) async {
    List<String> list = [];
    QuerySnapshot<Map<String, dynamic>> data = await _db
        .collection(collectionName)
        .where(DataBaseCollectionKeys.documentId, isEqualTo: userEmail)
        .get();
    if (data.docs.isNotEmpty) {
      for (var doc in data.docs) {
        list.add(doc.data()[key]);
      }
      return list;
    } else {
      return null;
    }
  }
}
