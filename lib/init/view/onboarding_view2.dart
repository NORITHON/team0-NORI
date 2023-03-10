import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/init/view/onboarding_view3.dart';
import 'package:flutter_norithon_team0/init/controller/onboarding_controller.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/post/model/post.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_norithon_team0/post/view/add_post_view.dart';
import 'package:flutter_norithon_team0/post/view/home_view.dart';

class OnboardingView2 extends StatefulWidget {
  const OnboardingView2({super.key});

  @override
  State<OnboardingView2> createState() => _OnboardingView2State();
}

class _OnboardingView2State extends State<OnboardingView2> {
  static final storage = FlutterSecureStorage();
  PostController _postController = Get.find();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OnboardingController());
    int index = -1;

    return Scaffold(
      body: Stack(
        children: [
          Container(child: Image.asset('assets/image/image-onboarding2.png')),
          Column(
            children: [
              SizedBox(
                height: 700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  index == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              index = -1;
                            });
                          },
                          child: // ),
                              Image.asset(
                                  width: 70,
                                  height: 70,
                                  "assets/button/button-yes-click.png"),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          child: // ),
                              Image.asset(
                                  width: 70,
                                  height: 70,
                                  "assets/button/button-yes.png"),
                        ),
                  index == 1
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              index = -1;
                            });
                          },
                          child: // ),
                              Image.asset(
                                  width: 70,
                                  height: 70,
                                  'assets/button/button-normal-click.png'),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          child: // ),
                              Image.asset(
                                  width: 70,
                                  height: 70,
                                  'assets/button/button-normal.png'),
                        ),
                  index == 2
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              index = -1;
                            });
                          },
                          child: // ),
                              Image.asset(
                                  width: 70,
                                  height: 70,
                                  'assets/button/button-no-click.png'),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          child: // ),
                              Image.asset(
                                  width: 70,
                                  height: 70,
                                  'assets/button/button-no.png'),
                        ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      String now = DateTime.now().toString();
                      await storage.write(key: "user", value: now);
                      await _postController.initControllerByUid(now);
                      Get.offAll(() => AddPostView());
                    },
                    child: // ),
                        Image.asset(
                            width: 55,
                            height: 50,
                            'assets/button/button-skip.png'),
                  ),
                  SizedBox(
                    width: 310,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(OnboardingView3());
                    },
                    child: // ),
                        Image.asset(
                            width: 26,
                            height: 50,
                            'assets/button/button-next.png'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
