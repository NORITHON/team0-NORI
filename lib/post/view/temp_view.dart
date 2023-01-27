import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class TempView extends StatefulWidget {
  const TempView({super.key});

  @override
  State<TempView> createState() => _TempViewState();
}

class _TempViewState extends State<TempView> {
  final _postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post"),
        actions: [
          IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.person,
              ))
        ],
      ),
      body: Center(
        child: GetBuilder<PostController>(
          builder: (_) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                ElevatedButton(
                    onPressed: () async {
                      List<Post> pList = _postController.postList;
                      Post post = Post(
                          id: pList[pList.length - 1].id! + 1,
                          imageUrl: "aa",
                          text: "abx",
                          updatedAt: 0,
                          createdAt: 0,
                          completed: false,
                          deleted: false);
                      await _postController.createPost(post);
                    },
                    child: Text("추가")),
                Expanded(
                  child: ListView.builder(
                      itemCount: _postController.postList.length * 2,
                      itemBuilder: (context, index) {
                        if (index.isOdd) return const Divider();
                        final idx = index ~/ 2;
                        return ListTile(
                          title: Text(_postController.postList[idx].text!),
                        );
                      }),
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}
