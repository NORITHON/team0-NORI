import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';

class PostApplication {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(Post data) async {
    await _firestore.collection('Post').add(data.toJson());
  }

  Future<void> getPosts(List<Post> storePostList) async {
    CollectionReference<Map<String, dynamic>> reference =
        _firestore.collection('Post');
    var querySnapshot = await reference.get();

    for (var doc in querySnapshot.docs) {
      Post post = Post.fromJson(doc.data());
      post.id = doc.id;
      storePostList.add(post);
    }
  }

  Future<Post> getPostById(String id) async {
    Post result = Post();
    DocumentReference<Map<String, dynamic>> reference =
        _firestore.collection('Post').doc(id);

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

  Future<void> deletePost(String deleteId) async {
    _firestore.collection('Post').doc(deleteId).delete();
  }

  // Favorite CRUD
  Future<void> createFavoritePost(Post favoriteData, String uid) async {
    DocumentReference reference = _firestore
        .collection('Member')
        .doc(uid)
        .collection('FavoritePost')
        .doc(favoriteData.id);

    await reference.set({"createdAt": favoriteData.createdAt});
  }

  Future<void> getFavoritePosts(List<Post> storePostList, String uid) async {
    storePostList.clear();

    CollectionReference<Map<String, dynamic>> reference =
        _firestore.collection('Member').doc(uid).collection('FavoritePost');
    var querySnapshot = await reference.get();

    for (var doc in querySnapshot.docs) {
      Post post = await getPostById(doc.id);
      storePostList.add(post);
    }
  }

  Future<void> deleteFavoritePost(String deleteId, String uid) async {
    await _firestore
        .collection('Member')
        .doc(uid)
        .collection('FavoritePost')
        .doc(deleteId)
        .delete();
  }

  // Nori CRUD
  Future<void> createNoriPost(
      Post noriData, DateTime pickedDate, String uid) async {
    _firestore.collection('Member').doc(uid).collection('FavoritePost').add({
      "postId": noriData.id.toString(),
      "todoData": pickedDate.toString(),
    });
  }

  Future<void> getNoriPosts(
      List<Post> storePostList, DateTime pickedDate, String uid) async {
    storePostList.clear();

    CollectionReference<Map<String, dynamic>> reference =
        _firestore.collection('Member').doc(uid).collection('NoriPost');
    var querySnapshot = await reference.get();

    for (var doc in querySnapshot.docs) {
      Post post = await getPostById(doc.data()["postId"]);
      var todoDate = DateTime.parse(doc.data()["todoDate"]);
      var difference = pickedDate.difference(todoDate).inDays;
      if (difference == 0) storePostList.add(post);
    }
  }

  Future<void> deleteNoriPost(
      String deleteId, DateTime pickedDate, String uid) async {
    CollectionReference<Map<String, dynamic>> reference =
        _firestore.collection('Member').doc(uid).collection('NoriPost');
    var querySnapshot = await reference.get();

    for (var doc in querySnapshot.docs) {
      var todoDate = DateTime.parse(doc.data()["todoDate"]);
      var difference = pickedDate.difference(todoDate).inDays;
      if (doc.data()["postId"] == deleteId.toString() && difference == 0) {
        await _firestore
            .collection('Member')
            .doc(uid)
            .collection('NoriPost')
            .doc(doc.id)
            .delete();
        break;
      }
    }
  }
}
