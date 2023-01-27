import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/post/model/post.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final PostController _postController = Get.find();
  Post detailPost = Post();

  @override
  void initState() {
    detailPost = _postController.selectedPost!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PostController>(builder: (_) {
        return Row(
          children: [
            Expanded(
              child: Container(
                color: Color(0xffFFF6E6),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Image.asset(
                            detailPost.titleImageUrl!,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: // ),
                                      Image.asset(
                                          width: 58,
                                          height: 59,
                                          'assets/button/button-back.png'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 200,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 300,
                                ),
                                // Icon(Icons.zoom_out_map_outlined),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: // ),
                                      Image.asset(
                                          width: 100,
                                          height: 100,
                                          'assets/button/button-post-url-run.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 26),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(26, 0, 26, 0),
                            padding: EdgeInsets.all(0),
                            color: Colors.white,
                            child: Image.asset(
                                fit: BoxFit.fill, detailPost.contentImageUrl!),
                          ),
                          SizedBox(height: 26),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              !_postController.isFavorite
                                  ? InkWell(
                                      onTap: () {
                                        _postController
                                            .favoritePost(detailPost);
                                      },
                                      child: // ),
                                          Image.asset(
                                              width: 58,
                                              height: 59,
                                              'assets/button/button-favarite-not-active.png'),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        _postController
                                            .unFavoritePost(detailPost);
                                      },
                                      child: // ),
                                          Image.asset(
                                              width: 58,
                                              height: 59,
                                              'assets/button/button-favorite-active.png'),
                                    ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 59,
                                width: 272,
                                child: ElevatedButton(
                                  child: const Text(
                                    '오늘의 노리 추가하기 ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    primary: Color(0xFFFFBA35),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
