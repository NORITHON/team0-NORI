import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'post/view/post_view.dart';

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
            Image.asset(
              width: 400,
              // height: 142,
              'assets/image/image-button-home1.png',
            ),
            Image.asset(
                width: 400,
                // height: 142,
                'assets/image/image-button-home2.png'),
          ],
        ),
      ),
    ); 
  }
}
