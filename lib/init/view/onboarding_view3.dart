import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/init/controller/onboarding_controller.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_norithon_team0/post/view/add_post_view.dart';
import 'package:flutter_norithon_team0/post/view/home_view.dart';

class OnboardingView3 extends StatefulWidget {
  const OnboardingView3({super.key});

  @override
  State<OnboardingView3> createState() => _OnboardingView3State();
}

class _OnboardingView3State extends State<OnboardingView3> {
  static final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OnboardingController());
    final PostController _postController = Get.find();
    int index = -1;

    return Scaffold(
      body: Stack(
        children: [
          Container(child: Image.asset('assets/image/image-onboarding3.png')),
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
                      Get.to(() => AddPostView());
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
                    onTap: () async {
                      String now = DateTime.now().toString();
                      await storage.write(key: "user", value: now);
                      await _postController.initControllerByUid(now);
                      Get.offAll(() => HomeView());
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
