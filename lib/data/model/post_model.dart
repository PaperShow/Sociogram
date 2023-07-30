import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? postId;
  final String? userId;
  final String? content;
  final Timestamp? addedDate;
  final int? likes;
  final List<Comment>? comment;
  PostModel({
    this.postId,
    this.userId,
    this.content,
    this.addedDate,
    this.likes,
    this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'content': content,
      'addedDate': addedDate?.millisecondsSinceEpoch,
      'likes': likes,
      'comment': comment?.map((x) => x.toMap()).toList(),
    };
  }

  PostModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : postId = doc.id,
        userId = doc['userId'],
        content = doc['content'],
        addedDate = doc['addedDate'],
        likes = doc['likes']?.toInt(),
        comment = List<Comment>.from(
            doc['comment'].map((x) => Comment.fromDocumentSnapshot(x)));
}

class Comment {
  final String? userId;
  final String? comment;
  final Timestamp? addedDate;
  Comment({
    this.userId,
    this.comment,
    this.addedDate,
  });

  Comment.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : userId = doc.id,
        comment = doc['comment'] ?? '',
        addedDate = doc['addedDate'] ?? '';

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'comment': comment,
      'addedDate': addedDate,
    };
  }

  Comment copyWith({
    String? userId,
    String? comment,
    Timestamp? addedDate,
  }) {
    return Comment(
      userId: userId ?? this.userId,
      comment: comment ?? this.comment,
      addedDate: addedDate ?? this.addedDate,
    );
  }
}
