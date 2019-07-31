import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'homeDrawer.dart';

class Home extends StatelessWidget {
  final List<Color> colors = [Colors.pinkAccent, Colors.orange];
  final List<Color> colors2 = [Color(0xffff7ae9), Color(0xfff2855c)];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 410,
              child: Stack(
                children: <Widget>[
                  buildTopGradient(size),
                  buildTitle(),
                  buildImage(),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildInfoColumn(),
            buildBottomRow(size),
          ],
        ),
      ),
      drawer: HomeDrawer(),
    );
  }

  Widget buildTopGradient(Size size) {
    return Container(
      height: 300,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 1],
          )),
    );
  }

  Widget buildTitle() {
    return Positioned(
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(30),
        child: Center(
          child: Text(
            "Find My Soulmate",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Great_Vibes',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      left: 30,
      right: 30,
      top: 100,
    );
  }

  Widget buildImage() {
    return Positioned(
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(30),
        child: Image.asset(
          "assets/img/girl3.jpg",
        ),
      ),
      left: 30,
      right: 30,
      top: 180,
    );
  }

  Widget buildInfoColumn() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Text(
            "Jennifer Aniston - 28",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.blueGrey,
              ),
              Text(
                "San Diego, California, USA",
                style: TextStyle(color: Colors.blueGrey.shade600),
              ),
            ],
          ),
          Container(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                color: Colors.blueGrey,
                icon: Icon(FontAwesomeIcons.instagram),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.blueGrey,
                icon: Icon(FontAwesomeIcons.facebookF),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.blueGrey,
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBottomRow(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
      height: 90,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: 30),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2, 1],
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 35,
            left: size.width / 2.7,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
