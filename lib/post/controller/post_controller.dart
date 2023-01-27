import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:flutter_norithon_team0/post/application/post_application.dart';

class PostController extends GetxController {
  List<Post> postList = [];
  List<Post> favoritePostList = [];
  List<Post> noriPostList = [];
  String? uid;
  final PostApplication _postApplication = PostApplication();

  Future<void> createPost(Post post) async {
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

  Future<void> fetchFavoritePosts() async {
    await _postApplication.getFavoritePosts(favoritePostList);
    update();
  }

  Future<void> favoritePost(Post post) async {
    await _postApplication.createFavoritePost(post);
    await fetchFavoritePosts();
  }

  Future<void> unFavoritePost(Post post) async {
    await _postApplication.deleteFavoritePost(post.id!);
    await fetchFavoritePosts();
  }

  Future<void> fetchNoriPosts() async {
    await _postApplication.getNoriPosts(noriPostList);
    update();
  }

  Future<void> addNoriPost(Post post) async {
    await _postApplication.createNoriPost(post);
    await fetchNoriPosts();
  }

  Future<void> deleteNoriPost(Post post) async {
    await _postApplication.deleteNoriPost(post.id!);
    await fetchNoriPosts();
  }

  Future<void> initControllerByUid(String uid) async {
    _postApplication.uid = uid;
    this.uid = uid;
    await fetchPosts();
    await fetchFavoritePosts();
    await fetchNoriPosts();
  }

  @override
  void onInit() {
    fetchPosts().then((_) async {
      await fetchFavoritePosts();
      await fetchNoriPosts();
      super.onInit();
    });
  }
}
