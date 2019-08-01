import 'dart:ui';

import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final movie;
  final String imageUrl;
  final Color mainColor;

  const MovieDetails(
      {Key key,
      @required this.movie,
      @required this.imageUrl,
      @required this.mainColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl + movie['poster_path']),
                  fit: BoxFit.fill),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.8),
            ),
          ),
          buildMovieInfo(size),
          Positioned(
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            height: 60,
            width: size.width,
          ),
        ],
      ),
    );
  }

  Widget buildMovieInfo(Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: buildImage(size),
          ),
          Expanded(
            flex: 2,
            child: buildTitleRow(),
          ),
          Expanded(
            child: buildDescriptionRow(),
            flex: 4,
          ),
          Expanded(
            child: buildButtonsRow(),
          ),
        ],
      ),
    );
  }

  Widget buildImage(Size size) {
    return Container(
      width: size.width / 1.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          imageUrl + movie['poster_path'],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildTitleRow() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            movie['title'],
            style: MyTextStyle().titles,
          ),
        ),
        Expanded(
          child: Text(
            "${movie['vote_average']}/10",
            style: MyTextStyle().titles,
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }

  Widget buildButtonsRow() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: null,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Rate Movie",
                style: MyTextStyle().titles,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: null,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: null,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildDescriptionRow() {
    return Text(
      movie['overview'],
      style: MyTextStyle().normalText,
    );
  }
}

class MyTextStyle extends TextStyle {
  final TextStyle normalText = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontFamily: 'Arvo',
  );

  final TextStyle titles = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.white,
    fontFamily: 'Arvo',
  );
}
