import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference<Map<String, dynamic>> _collection;

  const UserRepository._privateConstructor(this._collection);

  static final UserRepository _instance = UserRepository._privateConstructor(
    FirebaseFirestore.instance.collection("users"),
  );

  factory UserRepository.instance() {
    return _instance;
  }

  Future<DocumentReference<Map<String, dynamic>>> create(
      Map<String, dynamic> data) async {
    return await _collection.add(data);
  }
}
