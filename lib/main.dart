import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:flutter_norithon_team0/post/view/post_view.dart';
import 'package:flutter_norithon_team0/util/theme.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:flutter_norithon_team0/init/view/onboarding_screen.dart';

import 'home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Name',
      theme: TodoTheme.lightThemeData,
      // home: const Home(),     navigation bar 추가 시 사용
      home: UserAuth(),
    );
  }
}

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  static final storage = FlutterSecureStorage();
  String? uid;
  PostController _postController = Get.put(PostController());

  _onBoarding() async {
    uid = await storage.read(key: "user");

    if (uid != null) {
      _postController.initControllerByUid(uid!);
      Get.to(() => PostView());
    }
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _onBoarding();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}
