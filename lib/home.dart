import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/init/view/onboarding_view.dart';
import 'package:flutter_norithon_team0/post/view/add_post_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/image/image-home-bg.png"), // 배경 이미지
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(370),
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(() => OnboardingView());
              },
              child: Image.asset(
                width: 400,
                // height: 142,
                'assets/image/image-button-home1.png',
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}
