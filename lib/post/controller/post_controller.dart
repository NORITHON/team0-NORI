import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:flutter_norithon_team0/post/application/post_application.dart';

class PostController extends GetxController {
  List<Post> postList = [];
  List<Post> favoritePostList = [];
  List<Post> noriPostList = [];
  List<bool> completeTodo = [];
  Post? selectedPost;
  String? uid;
  bool isLoaded = false;
  bool isFavorite = false;
  bool isNori = false;
  DateTime pickedDate = DateTime.now();
  String? timeString = "";

  FlutterSecureStorage storage = const FlutterSecureStorage();

  final PostApplication _postApplication = PostApplication();

  Future<bool> isTodayNori(Post post) async {
    pickedDate = DateTime.now();
    await fetchNoriPosts();

    for (Post nori in noriPostList) {
      if (post.id == nori.id) {
        return true;
      }
    }
    return false;
  }

  Future<void> toggleCompleteTodo(int index) async {
    completeTodo[index] = !completeTodo[index];
    await _postApplication.updateNoriPostCompleted(
        noriPostList[index].id!, pickedDate, uid!, completeTodo[index]);
    update();
  }

  void getDateByString() {
    String monthAndDay = DateFormat('MM/dd').format(pickedDate).toString();
    String e = DateFormat.E().format(pickedDate).toString();
    timeString = "$monthAndDay($e)";
    update();
  }

  Future<void> addDate() async {
    pickedDate = pickedDate.add(const Duration(days: 1));
    getDateByString();
    await fetchNoriPosts();
    update();
  }

  Future<void> subtractDate() async {
    pickedDate = pickedDate.subtract(const Duration(days: 1));
    getDateByString();
    await fetchNoriPosts();
    update();
  }

  void selectPost(Post post) {
    selectedPost = post;
    isFavorite = false;
    for (Post f in favoritePostList) {
      if (f.id == post.id) {
        isFavorite = true;
      }
    }
    update();
  }

  Future<void> createPost(Post post) async {
    await _postApplication.createPost(post);
    await fetchPosts();
  }

  Future<void> fetchPosts() async {
    postList = [];
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
    await _postApplication.getFavoritePosts(favoritePostList, uid!);
    update();
  }

  Future<void> favoritePost(Post post) async {
    if (isFavorite) return;

    isFavorite = true;
    await _postApplication.createFavoritePost(post, uid!);
    await fetchFavoritePosts();
  }

  Future<void> unFavoritePost(Post post) async {
    if (!isFavorite) return;

    isFavorite = false;
    await _postApplication.deleteFavoritePost(post.id!, uid!);
    await fetchFavoritePosts();
  }

  Future<void> fetchNoriPosts() async {
    completeTodo = [];
    noriPostList = [];
    await _postApplication.getNoriPosts(
        noriPostList, completeTodo, pickedDate, uid!);
    for (int i = 0; i < noriPostList.length; i++) {
      completeTodo.add(false);
    }
    update();
  }

  Future<void> addNoriPost(Post post) async {
    await _postApplication.createNoriPost(post, pickedDate, uid!);
    await fetchNoriPosts();
  }

  Future<void> deleteNoriPost(Post post) async {
    await _postApplication.deleteNoriPost(post.id!, pickedDate, uid!);
    await fetchNoriPosts();
  }

  Future<void> initControllerByUid(String uid) async {
    this.uid = uid;
    await fetchPosts();
    await fetchFavoritePosts();
    await fetchNoriPosts();
  }

  @override
  void onInit() {
    fetchPosts().then((_) async {
      var storeData = await storage.read(key: "user");
      if (storeData != null) {
        await initControllerByUid(storeData);
      }
      isLoaded = true;
      getDateByString();
      update();
      super.onInit();
    });
  }
}
