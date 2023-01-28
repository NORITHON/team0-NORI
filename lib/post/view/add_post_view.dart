import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/home.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/post/view/detail_view.dart';
import 'package:flutter_norithon_team0/post/view/feedback_view.dart';
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
  late PostController _postController = Get.find();

  Widget postListTile(BuildContext context) {
    return GetBuilder<PostController>(builder: (_) {
      return GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _postController.postList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 2 의 비율
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 160),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () async {
                _postController.selectPost(_postController.postList[i]);
                _postController.isNori = await _postController
                    .isTodayNori(_postController.postList[i]);
                Get.to(() => const DetailView());
              },
              child: Image.asset(
                width: double.infinity,
                height: 100,
                _postController.postList[i].imageUrl!,
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          shadowColor: colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          title: Text(
            '노리 추가하기',
            style: textTheme.headline3?.copyWith(
              color: colorScheme.onPrimary,
              fontSize: 20,
            ),
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
        body: Container(
            margin: EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '이런 노리들의 루틴은 어때요?',
                      style: textTheme.headline2?.copyWith(
                          color: colorScheme.onSecondary, fontSize: 23),
                    ),
                    Container(margin: const EdgeInsets.fromLTRB(0, 0, 85, 0)),
                    Image.asset(
                      height: 15,
                      'assets/button/button-for-detail.png',
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    textAlign: TextAlign.left,
                    '의사선생님이 추천하고 있어요',
                    style: textTheme.bodyText1?.copyWith(
                      color: colorScheme.background,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(FeedBackView());
                  },
                  child: Image.asset(
                    width: 400,
                    // height: 142,
                    'assets/image/image-doctor-recommend1.png',
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: 34,
                        'assets/image/image-doctor-selector.png',
                      ),
                    ]),
                Container(
                  margin: EdgeInsets.all(26),
                ),
                Row(
                  children: [
                    Text(
                      '재밌는 노리들의 발견!',
                      style: textTheme.headline2?.copyWith(
                        color: colorScheme.onSecondary,
                      ),
                    ),
                    Container(margin: const EdgeInsets.fromLTRB(0, 0, 154, 0)),
                    Image.asset(
                      height: 15,
                      'assets/button/button-for-detail.png',
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                ),
                RefreshIndicator(
                  onRefresh: _postController.fetchPosts,
                  child: Center(child: postListTile(context)),
                ),
              ],
            )));
  }
}
