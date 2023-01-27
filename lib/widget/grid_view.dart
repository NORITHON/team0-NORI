import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Test {
  String title;
  String subtitle;
  String image;

  Test(this.title, this.subtitle, this.image);
}

class Grid_View extends StatefulWidget {
  const Grid_View({super.key});

  @override
  State<Grid_View> createState() => _Grid_ViewState();
}

class _Grid_ViewState extends State<Grid_View> {
  @override
  Widget build(BuildContext context) {
    bool _onclick = true;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    List<Test> test = [];
    test.add(Test("손씻기", "10분동안",
        "https://ouch-cdn2.icons8.com/LCIoHrpP8oRftvQf5FLvImQYB5zuoF6xNTtSPENEAys/rs:fit:683:456/extend:false/wm:1:re:0:0:0.8/wmid:ouch/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODIz/L2I1OGMzYTVlLTM1/NGYtNGZkNS05OWFi/LTRkZTczMGQ5NGQw/Ny5zdmc.png"));
    test.add(Test("발 운동하기", "열심히하기",
        "https://t1.daumcdn.net/cfile/tistory/2252584956DFD56507"));
    test.add(Test("손씻기", "10분동안",
        "https://ouch-cdn2.icons8.com/LCIoHrpP8oRftvQf5FLvImQYB5zuoF6xNTtSPENEAys/rs:fit:683:456/extend:false/wm:1:re:0:0:0.8/wmid:ouch/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODIz/L2I1OGMzYTVlLTM1/NGYtNGZkNS05OWFi/LTRkZTczMGQ5NGQw/Ny5zdmc.png"));
    test.add(Test("발 운동하기", "열심히하기",
        "https://t1.daumcdn.net/cfile/tistory/2252584956DFD56507"));

    return GridView.builder(
      itemCount: test.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5, //item 의 가로 1, 세로 2 의 비율
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: ((context, index) {
        return Card(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              AspectRatio(
                aspectRatio: 9 / 7,
                child: Image.network(
                  test[index].image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      _onclick ? _onclick = false : _onclick = true;
                    },
                    trailing: _onclick
                        ? Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.green,
                          )
                        : Icon(Icons.check_box, color: Colors.green),
                    isThreeLine: false,
                    title: Text(
                      test[index].title,
                      style: textTheme.headline3?.copyWith(
                        color: colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    //subtitle: Text(test[index].subtitle),
                    // trailing: Icon(Icons.check_box),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
