import 'package:flutter/material.dart';
import 'package:flutter_detail_norithon_2023/controller/onboarding_controller.dart';
import 'package:flutter_detail_norithon_2023/view/onboarding_view3.dart';
import 'package:get/get.dart';

class OnboardingView2 extends StatefulWidget {
  const OnboardingView2({super.key});

  @override
  State<OnboardingView2> createState() => _OnboardingView2State();
}

class _OnboardingView2State extends State<OnboardingView2> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OnboardingController());

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
                      Navigator.pop(context);
                    },
                    child: // ),
                        Image.asset(
                            width: 70,
                            height: 70,
                            'assets/button/button-normal.png'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                    onTap: () {
                      Navigator.pop(context);
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
                      Get.to(OnboardingView3());
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
