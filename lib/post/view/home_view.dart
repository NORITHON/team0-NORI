import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("home->addPost"),
        onPressed: () {
          // Get.to(() => const HomeView());
        },
      ),
    );
  }
}
