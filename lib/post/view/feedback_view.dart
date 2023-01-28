import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FeedBackView extends StatefulWidget {
  const FeedBackView({super.key});

  @override
  State<FeedBackView> createState() => _FeedBackViewState();
}

class _FeedBackViewState extends State<FeedBackView> {
  final _items = List.generate(50, (i) => ListTile(title: Text('No.$i')));
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            actions: [],
            backgroundColor: colorScheme.background,
            pinned: false,
            expandedHeight: 270.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/image-feedback.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            //fillOverscroll: true,
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  'assets/image/image-feedback_list.png',
                  width: 500,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
