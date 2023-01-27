import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';

class PostApplication {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost(Post post) async {
    DocumentReference reference =
        _firestore.collection('Post').doc(post.id.toString());
    await reference.set(post.toJson());
  }

  Future<void> fetchPosts(List<Post> storePostList) async {
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
}
