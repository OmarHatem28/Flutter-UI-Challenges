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
                  stops: [0.1, 1],
                )),
          ),
          Positioned(
            child: Container(
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/img/girl6.jpg"))),
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
