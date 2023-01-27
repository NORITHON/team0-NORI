import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/home.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/widget/grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../init/view/parents_form_view.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => AddPostViewState();
}

class AddPostViewState extends State<AddPostView> {
  late PostController postController = Get.put(PostController());

  Widget postListTile(BuildContext context) {
    return GetBuilder<PostController>(builder: (_postController) {
      return Expanded(
          child: GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: postController.postList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 2 의 비율
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 20),
              itemBuilder: (context, i) {
                return Card(
                  child: Image.asset(
                    width: double.infinity,
                    height: 400,
                    postController.postList[i].imageUrl!,
                  ),
                );
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
          shadowColor: colorScheme.shadow,
          elevation: 1.0,
          centerTitle: true,
          title: const Text(
            '노리 추가하기',
            // style: textTheme.headline2?.copyWith(
            //   color: colorScheme.onPrimary,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ParentsFormView());
              },
              child: Image.asset(
                width: 15,
                height: 15,
                'assets/button/button-back.png',
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: postController.fetchPosts,
          child: Center(
            child: postListTile(context),
          ),
        )
    );
  }
}
