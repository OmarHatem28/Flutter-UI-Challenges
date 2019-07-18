import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<Color> colors = [Colors.pinkAccent, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
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
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(30),
              child: Center(
                child: Text(
                  "Find My Soulmate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            left: 30,
            right: 30,
            top: MediaQuery.of(context).size.height / 6,
          ),
          Positioned(
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(30),
              child: Image.asset("assets/img/girl3.jpg"),
            ),
            left: 30,
            right: 30,
            top: MediaQuery.of(context).size.height / 3.5,
          ),
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
      drawer: Drawer(),
    );
  }
}
