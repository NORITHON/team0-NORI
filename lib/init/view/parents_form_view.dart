import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/view/home_view.dart';
import 'package:get/get.dart';

class ParentsFormView extends StatefulWidget {
  const ParentsFormView({super.key});

  @override
  State<ParentsFormView> createState() => _ParentsFormViewState();
}

class _ParentsFormViewState extends State<ParentsFormView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Container(
      child: TextButton(
        child: Text(
          "form->home",
          style: textTheme.headline3?.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          Get.to(() => const HomeView());
        },
      ),
    );
  }
}
