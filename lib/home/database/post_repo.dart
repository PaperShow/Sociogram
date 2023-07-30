import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sociogram/data/model/post_model.dart';

class PostRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPost(PostModel post) async {
    await _db.collection('post').doc(post.postId).set(post.toMap());
  }

  Future<void> updatePost(PostModel post) async {
    await _db.collection('post').doc(post.postId).update(post.toMap());
  }

  Future<void> deletePost(PostModel post) async {
    await _db.collection('post').doc(post.postId).delete();
  }

  Future<List<PostModel>> retrievePost() async {
    QuerySnapshot<Map<String, dynamic>> snap =
        await _db.collection('post').get();

    return snap.docs
        .map((docSnap) => PostModel.fromDocumentSnapshot(docSnap))
        .toList();
  }
}
