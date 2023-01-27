import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/widget/grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => AddPostViewState();
}

class AddPostViewState extends State<AddPostView> {
  Widget postListTile(BuildContext context) {
    return GetBuilder<PostController>(builder: (_postController) {
      return Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _postController.postList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 
              ),
              itemBuilder: (context, i) {
                return Card(
                  child: Image.asset(
                    'assets/image/image-post-summary1.png',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                );
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;

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
      body: postListTile(context),
      // )
      // )
    );
  }
}
