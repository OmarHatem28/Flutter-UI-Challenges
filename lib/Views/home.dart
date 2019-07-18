import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<Color> colors = [Colors.pinkAccent, Colors.orange];
  List<Color> colors2 = [Color(0xffff7ae9), Color(0xfff2855c)];

  List<Widget> drawerTiles = [
    ListTile(
      title: Text(
        "Find My Soul Mate",
        style: TextStyle(
          fontFamily: 'Great_Vibes',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
  ];

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
                      fontFamily: 'Great_Vibes',
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
          buildBottomRow(context),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 12,
            left: MediaQuery.of(context).size.width / 2.35,
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
      drawer: buildDrawer(),
    );
  }

  Widget buildDrawer() {
    return Drawer(
        child: Column(
      children: <Widget>[
        Expanded(
          child: UserAccountsDrawerHeader(
//            currentAccountPicture: ,
              accountName: Text("Omar Hatem"),
              accountEmail: Text("omarh.ismail1@gmail.com")),
          flex: 2,
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: drawerTiles.length,
            itemBuilder: (context, i) {
              return drawerTiles[i];
            },
          ),
        ),
      ],
    ));
  }

  Widget buildBottomRow(BuildContext context) {
    return Positioned(
        bottom: 30,
        left: 20,
        right: 20,
        child: Container(
          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 1],
              )),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: null,
                    color: Colors.white,
                    highlightColor: Colors.orange,
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: null,
                    color: Colors.white,
                    highlightColor: Colors.orange,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: null,
                    color: Colors.white,
                    highlightColor: Colors.orange,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    onPressed: null,
                    color: Colors.white,
                    highlightColor: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
