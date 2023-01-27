import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/widget/grid_view.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  final PostController _postController = Get.find();
  List<String> postList = ['text1', 'text2'];

  Widget postListTile(BuildContext context) {
    // return GetBuilder<PostController>(builder: (_postController) {
    // return ListView.builder(
    return ListView.builder(
        padding: const EdgeInsets.all(20),
        // itemCount: _postController.postList.length * 2,
        itemCount: 2,
        itemBuilder: (context, i) {
          return Text(
            postList[i],
            // )
            // return Card(
            //   child: ListTile(
            //     // leading: FlutterLogo(),
            //     title: Text(postList[i]),
            //   ),
          );
        });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;
    print(_postController.uid);

    return Scaffold(
      appBar: AppBar(
          shadowColor: colorScheme.shadow,
          elevation: 1.0,
          centerTitle: true,
          title: const Text('AppName'
              // TODO: add font style
              )),
      // body: RefreshIndicator(
      //     onRefresh: () {
      //       Future temp = "hi" as Future;
      //       return temp;
      //     },
      // body: Container(
      //   margin: const EdgeInsets.all(10.0),
      //   width: 48.0,
      //   height: 48.0,
      body: Center(child: postListTile(context)),
      // )
      // )
    );
  }
}
