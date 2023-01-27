import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/init/view/parents_form_view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/view/post_view.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PostController _postController = Get.put(PostController());
  static final storage = FlutterSecureStorage();

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      imagePadding: EdgeInsets.only(top: 40),
      pageColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        // 대부분의 온보딩 스크린은 여러 페이지로 구성되어 있기 때문에, 칼럼 위젯처럼 pages 알규먼트는 리스트를 불러와야 한다.
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the fist page',
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the second page'
              'We are making on-boarding screens.'
              'It is very interesting ',
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the third page'
              'We are making on-boarding screens.'
              'It is very interesting',
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('done'),
      onDone: () async {
        var now = DateTime.now().toString();
        await storage.write(key: "user", value: now);
        await _postController.initControllerByUid(now);
        Get.offAll(() => const ParentsFormView());
      },
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.cyan,
      ),
      showSkipButton: true,
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        activeColor: Colors.red,
      ),
      curve: Curves.bounceOut,
    );
  }
}
