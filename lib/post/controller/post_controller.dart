import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:flutter_norithon_team0/post/application/post_application.dart';

class PostController extends GetxController {
  List<Post> postList = [];
  PostApplication _postApplication = PostApplication();
    
  Future<void> createPost(Post post) async {
    print("create");
    await _postApplication.createPost(post);
    await fetchPost();
  }

  Future<void> fetchPost() async {
    await _postApplication.fetchPosts(postList);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchPost();
  }
}
