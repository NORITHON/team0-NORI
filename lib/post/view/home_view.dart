import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          print("hi");
                        },
                        child: // ),
                            Image.asset(
                                width: 30,
                                height: 30,
                                'assets/button/button-heart.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          print("hi");
                        },
                        child: // ),
                            Image.asset(
                                width: 30,
                                height: 30,
                                'assets/button/button-childmode.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                          width: 70,
                          height: 70,
                          'assets/image/image-profile.png'),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "성희",
                                  style: textTheme.headline3?.copyWith(
                                    color: colorScheme.onPrimary,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "10세 . 남",
                                  style: textTheme.headline3?.copyWith(
                                    color: colorScheme.background,
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(width: 100),
                              ],
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                                width: 256,
                                height: 24,
                                'assets/image/image-bar.png'),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Divider(
            //color: Colors.grey,
            height: 30,
            thickness: 9,
          ),
        ],
      ),
    );
  }
}
