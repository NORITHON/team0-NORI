import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:flutter_norithon_team0/post/application/post_application.dart';

class PostController extends GetxController {
  List<Post> postList = [];
  final PostApplication _postApplication = PostApplication();

  Future<void> createPost(Post post) async {
    print("create");
    await _postApplication.createPost(post);
    await fetchPosts();
  }

  Future<void> fetchPosts() async {
    await _postApplication.getPosts(postList);
    update();
  }

  Future<void> updatePost(Post post) async {
    await _postApplication.updatePost(post);
    await fetchPosts();
  }

  Future<void> deletePost(Post post) async {
    await _postApplication.deletePost(post.id!);
    await fetchPosts();
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}
