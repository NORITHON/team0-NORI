import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/init/view/onboarding_view2.dart';
import 'package:flutter_norithon_team0/init/controller/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_norithon_team0/post/view/add_post_view.dart';
import 'package:flutter_norithon_team0/post/view/home_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  OnboardingController _onboardingController = Get.put(OnboardingController());
  static final storage = FlutterSecureStorage();
  
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          Container(child: Image.asset('assets/image/image-onboarding1.png')),
          Column(
            children: [
              SizedBox(
                height: 700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: // ),
                        Image.asset(
                            width: 70,
                            height: 70,
                            "assets/button/button-yes.png"),
                  ),
                  InkWell(
                    onTap: () {
                    },
                    child: // ),
                        Image.asset(
                            width: 70,
                            height: 70,
                            'assets/button/button-normal.png'),
                  ),
                  InkWell(
                    onTap: () {
                      print("hi");
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
                      await storage.write(
                          key: "user", value: DateTime.now().toString());
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
                      Get.to(() => OnboardingView2());
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
