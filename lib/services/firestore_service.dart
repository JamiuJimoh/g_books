import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Stream<List<T>> collectionStream<T>({
    required String path,
    required String uid,
    required T Function(Map<String, dynamic> data) builder,
  }) {
    final ref = FirebaseFirestore.instance.collection(path);
    final snapshot = ref.snapshots();

    return snapshot.map((snapshot) =>
        snapshot.docs.map((snapshot) => builder(snapshot.data())).toList());
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    await reference.set(data);
  }
}
