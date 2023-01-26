import 'package:flutter/material.dart';
import 'package:flutter_norithon_team0/post/controller/post_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
            shadowColor: colorScheme.shadow,
            elevation: 1.0,
            centerTitle: true,
            title: const Text('AppName'
                // TODO: add font style
                )),
        body: Center(
          child: GetBuilder<PostController>(builder: (_postController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: ListView(children: const <Widget>[
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text('text1'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text('text1'),
                      ),
                    )
                  ]),
                )
              ],
            );
          }),
        ));
  }
}
