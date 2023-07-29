import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sociogram/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future addUserData(UserModel userData) async {
    await _db.collection("Users").doc(userData.uid).set(userData.toMap());
  }

  Future<List<UserModel>> retrieveUserData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
