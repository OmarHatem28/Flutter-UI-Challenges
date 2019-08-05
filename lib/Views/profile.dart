import 'package:flutter/material.dart';
import 'package:ui_challenges/Models/item.dart';
import 'package:ui_challenges/Models/subItem.dart';

class Profile extends StatelessWidget {

  final List<Item> items = [
    Item(name: "Collection", subItems: [
      SubItem('Photos', 'assets/img/girl4.jpg'),
      SubItem('Travel', 'assets/img/girl6.jpg'),
      SubItem('Food', 'assets/img/girl3.jpg'),
    ]),
    Item(name: "Most Like Posts", subItems: [
      SubItem('Photos', 'assets/img/girl1.jpg'),
      SubItem('Travel', 'assets/img/girl2.jpg'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: buildBody(size),
      ),
    );
  }

  Widget buildBody(Size size) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff91ceff),
                    Color(0xff4dafff),
                    Color(0xff1c99ff),
                    Color(0xff007ade),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 120),
              height: size.height - size.height / 3,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 8, bottom: 16, right: 8),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              items[i].name,
                              style: MyTextStyle().bold,
                            ),
                            Spacer(),
                            Text("View all (${items[i].subItems.length})", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(
                          child: ListView.builder(
//                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: items[i].subItems.length,
                            itemBuilder: (context, j) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(items[i].subItems[j].image),
                                ),
                              );
                            },
                          ),
                          height: 150,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          top: size.height / 5,
          left: size.width / 10,
          height: 200,
          width: 300,
          child: Card(
            elevation: 10,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Jennifer Aniston",
                      style: MyTextStyle().bold,
                    ),
                  ),
                  Text("Actress | Model | Dev"),
                  Container(
                    child: Divider(
                      color: Colors.blueGrey,
                    ),
                    padding: EdgeInsets.only(left: 30, right: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buildTextColumn(title: "228", sub: "Posts"),
                      buildTextColumn(title: "10.6K", sub: "Followers"),
                      buildTextColumn(title: "28", sub: "Following"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height / 8,
          left: size.width / 2.7,
          height: 100,
          width: 100,
          child: Container(
            decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(
                    image: AssetImage('assets/img/girl5.jpg'),
                    fit: BoxFit.cover)),
          ),
        )
      ],
    );
  }

  Widget buildTextColumn({String title, String sub}) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            title,
            style: MyTextStyle().bold,
          ),
        ),
        Text(
          sub,
          style: MyTextStyle().sub,
        ),
      ],
    );
  }
}

class MyTextStyle extends TextStyle {
  final TextStyle bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final TextStyle sub = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
}
