import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/view/post_view.dart';
import 'package:flutter_norithon_team0/util/theme.dart';

import 'home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: PostView(),
    );
  }
}
