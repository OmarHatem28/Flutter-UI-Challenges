import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  final movie;
  final String imageUrl;

  const MovieDetails({Key key, @required this.movie, @required this.imageUrl})
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
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          buildMovieInfo(size),
        ],
      ),
    );
  }

  Widget buildMovieInfo(Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: buildImage(size),
          ),
          Expanded(
            child: buildTitleRow(),
          ),
//          Expanded(
//            child: buildInfoRow(),
//          ),
          Expanded(
            child: buildDescriptionRow(),
            flex: 4,
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
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            movie['title'],
            style: MyTextStyle().titles,
          ),
          Spacer(),
          Text(
            "${movie['vote_average']}/10",
            style: MyTextStyle().titles,
          )
        ],
      ),
    );
  }

//  Widget buildInforRow() {
//    return Row(
//      children: <Widget>[
//        Text("Original Language:", style: MyTextStyle().titles,),
//        Spacer(),
//
//      ],
//    )
//  }

  Widget buildDescriptionRow() {
    return Text(movie['overview'], style: MyTextStyle().normalText,);
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
