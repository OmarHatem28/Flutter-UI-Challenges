import 'dart:math';

import 'package:flutter/material.dart';

class Playground extends StatelessWidget {
  final colors = [
    Color(0xFFEF7A85),
    Color(0xFFFF90B3),
    Color(0xFFFFC2E2),
    Color(0xFF8c4fff),
    Color(0xFF826ab0),
    Color(0xFF5927b8),
    Color(0xFFB892FF),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int rand, randImg;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 175),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, i) {
                  rand = new Random().nextInt(colors.length);
                  randImg = new Random().nextInt(6) + 1;
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: height / 5,
                          color: colors[rand],
                        ),
                      ),
                      Expanded(
                        flex: 12,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                              child: Text(
                                "Intro of Requiem for a Dream Song.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Why must you mortal cut throw the balance that have been so carefully preserved.",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/img/girl$randImg.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                  color: colors[rand],
                                  offset: Offset(20, -20),
                                  spreadRadius: -10)
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            buildAppBar(width, height),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar(double width, double height) {
    return Container(
      height: 226,
//      color: Colors.blue,
      child: ClipPath(
          clipper: MyClipper(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/sand4.jfif'), fit: BoxFit.fill),
            ),
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text(
                    "Playground",
                    style: TextStyle(color: Colors.blue),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Omar Hatem"),
                    subtitle: Text("Junior Flutter Developer"),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/img/pp.png'),
                      radius: 25,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
