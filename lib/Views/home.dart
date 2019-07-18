import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  List<Color> colors = [ Colors.pinkAccent, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/img/girl1.jpg", height: 50, width: 50,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 1],
              )
          ),
        ),
        preferredSize: Size(0.0, MediaQuery.of(context).size.height / 1.8),
      ),
    );
  }
}
