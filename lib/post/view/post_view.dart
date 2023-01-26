import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
              ))
        ],
      ),
      body: Center(
        child: GetBuilder<PostController>(
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Text("post"),
            );
          },
        ),
      ),
    );
  }
}
