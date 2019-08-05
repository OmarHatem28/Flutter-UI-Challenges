import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildInfoCard(size),
        ],
      ),
    );
  }

  Widget buildInfoCard(Size size) {
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
              padding: EdgeInsets.only(top: 100),
              height: size.height - size.height / 3,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    title: Text("HI"),
                  ),
                  ListTile(
                    title: Text("HI"),
                  ),
                  ListTile(
                    title: Text("HI"),
                  ),
                  ListTile(
                    title: Text("HI"),
                  ),
                  ListTile(
                    title: Text("HI"),
                  ),
                  ListTile(
                    title: Text("HI"),
                  ),ListTile(
                    title: Text("HI"),
                  ),ListTile(
                    title: Text("HI"),
                  ),ListTile(
                    title: Text("HI"),
                  ),
                  ListTile(
                    title: Text("HI"),
                  ),
                ],
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
