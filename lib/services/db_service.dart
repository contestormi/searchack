import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseCollectionNames {
  static const String descriptionCollection = 'description';
}

abstract class DataBaseCollectionKeys {
  static const String text = 'text';
  static const String documentId = '__name__';
}

abstract class DataBaseService {
  Future<void> setDataForCollection(
      {required String collectionName,
      required String userEmail,
      required String text});

  Future<String> getDataFromCollection(
      {required String userEmail,
      required String collectionName,
      required String key});
}

class DataBaseServiceImpl implements DataBaseService {
  final FirebaseFirestore _db;

  DataBaseServiceImpl(this._db);

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
  Future<String> getDataFromCollection(
      {required String userEmail,
      required String collectionName,
      required String key}) async {
    QuerySnapshot<Map<String, dynamic>> data = await _db
        .collection(collectionName)
        .where(DataBaseCollectionKeys.documentId, isEqualTo: userEmail)
        .get();
    return data.docs.first.data()[key];
  }
}
