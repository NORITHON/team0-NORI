import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';

class PostApplication {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(Post data) async {
    DocumentReference reference =
        _firestore.collection('Post').doc(data.id.toString());
    await reference.set(data.toJson());
  }

  Future<void> getPosts(List<Post> storePostList) async {
    storePostList.clear();

    CollectionReference<Map<String, dynamic>> reference =
        _firestore.collection('Post');
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await reference.get();

    for (var doc in querySnapshot.docs) {
      Post post = Post.fromJson(doc.data());
      post.id = int.parse(doc.id);
      storePostList.add(post);
    }
  }

  Future<Post> getPostById(int id) async {
    Post result = Post();
    DocumentReference<Map<String, dynamic>> reference =
        _firestore.collection('Post').doc(id.toString());

    var snapshot = await reference.get();
    result = Post.fromJson(snapshot.data()!);
    result.id = id;

    return result;
  }

  Future<void> updatePost(Post updateData) async {
    DocumentReference reference =
        _firestore.collection('Post').doc(updateData.id.toString());

    await reference.set(updateData.toJson());
  }

  Future<void> deletePost(int deleteId) async {
    _firestore.collection('Post').doc(deleteId.toString()).delete();
  }
}
