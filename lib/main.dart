import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/view/post_view.dart';
import 'package:flutter_norithon_team0/util/theme.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name',
      theme: TodoTheme.lightThemeData,
      // home: const Home(),     navigation bar 추가 시 사용
      home: const PostView(),
    );
  }
}
