import 'package:flutter/material.dart';
import 'package:flutter_detail_norithon_2023/detail_v2.dart';
import 'package:flutter_detail_norithon_2023/detail_view.dart';
import 'package:flutter_norithon_team0/post/view/detail_view.dart';
import 'package:get/get.dart';

class TodoImage {
  String path;

  TodoImage(this.path);
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<TodoImage> todolist = [];
    todolist.add(TodoImage("assets/image/image-todo1.png"));
    todolist.add(TodoImage("assets/image/image-todo2.png"));
    todolist.add(TodoImage("assets/image/image-todo3.png"));

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
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "10세 . 남",
                                  style: TextStyle(fontSize: 12),
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
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        'assets/button/button-fast-arrow-left.png'),
              ),
              Text(
                "1/28(토)",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                        'assets/button/button-fast-arrow-right.png'),
              ),
            ],
          ),
          SizedBox(
            height: 23,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
              ),
              Text("방금 작성해주신 진단을 통해 추천된 노리 루틴이에요!")
            ],
          ),
          Expanded(
            child: ListView.separated(
              //scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: todolist.length + 1,
              itemBuilder: (context, index) {
                if (index != todolist.length) {
                  String imageName = todolist[index].path;
                  return InkWell(
                    onTap: () {
                      Get.to(() => const DetailView());
                      // print("hi");
                    },
                    child: Image.asset(width: 70, height: 70, imageName),
                  );
                } else {
                  return InkWell(
                      onTap: () {
                        Get.to(() => const DetailView());
                        // print("hi");
                      },
                      child: Image.asset(
                          width: 70, height: 70, 'assets/image/image-add.png'));
                }
              },
            ),
          ),
        ], //리스트의 개수
      ),
    );
  }
}
