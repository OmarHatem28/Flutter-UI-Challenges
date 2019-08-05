import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final List<Color> colors = [Colors.pinkAccent, Colors.orange];
  final drawerTiles = [
    {
      'text': 'Find My Soul Mate',
      'font': 'Great_Vibes',
      'path': '',
      'image': 'assets/img/heart1.jfif',
    },
    {
      'text': 'Beach',
      'font': '',
      'path': '/beach',
      'image': 'assets/img/beach3.jpg',
    },
    {
      'text': 'Curvy Drawer',
      'font': '',
      'path': '/curvyDrawer',
      'image': 'assets/img/curvyDrawer.png',
    },
    {
      'text': 'Playground',
      'font': 'Brushed',
      'path': '/playground',
      'image': 'assets/img/sand4.jfif',
    },
    {
      'text': 'Movies',
      'font': 'Arvo',
      'path': '/movies',
      'image': 'assets/img/movies.jpg',
    },
    {
      'text': 'Profile',
      'font': 'Arvo',
      'path': '/profile',
      'image': 'assets/img/profile.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Expanded(
          child: UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/img/pp.png"),
            ),
            accountName: Text("Omar Hatem"),
            accountEmail: Text(
              "omarh.ismail1@gmail.com",
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                stops: [0.2, 1],
              ),
            ),
          ),
          flex: 2,
        ),
        Expanded(
          flex: 5,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: drawerTiles.length * 2,
            itemBuilder: (context, i) {
              if (i.isOdd) return Divider();
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(drawerTiles[i ~/ 2]['image']),
                        fit: BoxFit.fill)),
                child: ListTile(
                  title: Center(
                    child: Text(
                      drawerTiles[i ~/ 2]['text'],
                      style: TextStyle(
                        fontFamily: drawerTiles[i ~/ 2]['font'].isEmpty
                            ? null
                            : drawerTiles[i ~/ 2]['font'],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1
                      ),
                    ),
                  ),
                  onTap: () => drawerTiles[i ~/ 2]['path'].isEmpty
                      ? Navigator.pop(context)
                      : Navigator.pushNamed(
                          context, drawerTiles[i ~/ 2]['path']),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
