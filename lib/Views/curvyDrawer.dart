import 'package:flutter/material.dart';

class CurvyDrawer extends StatelessWidget {
  var drawerTiles = [
    {
      'title': 'Home',
      'leading': Icons.home,
    },
    {
      'title': 'Your Profile',
      'leading': Icons.person_pin,
    },
    {
      'title': 'Settings',
      'leading': Icons.settings,
    },
    {
      'title': 'Contact Us',
      'leading': Icons.contact_mail,
    },
    {
      'title': 'Help',
      'leading': Icons.info_outline,
    },
  ];

  final Color primary = Color(0xff430175);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Curvy Drawer"),
        backgroundColor: primary,
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return FlatButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  width: 100,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Open Drawer",
                    style: TextStyle(color: Colors.white),
                  ),
                ));
          },
        ),
      ),
      drawer: buildDrawer(context),
    );
  }

  Widget buildDrawer(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Container(
        color: primary,
        width: width,
        padding: EdgeInsets.only(right: width / 3),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.pink, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/girl1.jpg'),
                  radius: width / 4 - 18,
                ),
              ),
            ),
            Container(
              child: Text(
                "Jennifer Aniston",
                style: TextStyle(color: Colors.white),
              ),
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              child: Text(
                "@JennyAn28",
                style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: drawerTiles.length * 2,
                itemBuilder: (context, i) {
                  if (i.isOdd)
                    return Divider(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      indent: 20,
                    );
                  return ListTile(
                    title: Text(
                      drawerTiles[i ~/ 2]['title'],
                      style:
                          TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                    ),
                    leading: Icon(
                      drawerTiles[i ~/ 2]['leading'],
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width / 1.5, 0);
    path.quadraticBezierTo(
        size.width - 30, size.height / 4, size.width - 30, size.height / 2);
    path.quadraticBezierTo(
        size.width - 30, size.height * 3 / 4, size.width / 1.5, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
