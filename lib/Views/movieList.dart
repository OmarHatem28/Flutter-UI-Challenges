import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MovieListState();
}

class MovieListState extends State<MovieList> {
  var response;
  final imageUrl = 'https://image.tmdb.org/t/p/w500/';
  Color mainColor = const Color(0xff3C3261);

  Future<Map> getJSON() async {
    var url =
        'http://api.themoviedb.org/3/discover/movie?api_key=004cbaf19212094e32aa9ef6f6577f22';
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    response = getJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(fontFamily: 'Arvo', color: Colors.indigo),
        ),
        backgroundColor: Colors.white,
        elevation: 4.0,
        centerTitle: true,
        leading: Icon(
          Icons.local_movies,
          color: Colors.red,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Top Rated",
              style: TextStyle(
                  color: Colors.indigo,
                  fontFamily: 'Arvo',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.blueGrey,
            ),
            FutureBuilder<Map>(
              future: response,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //Text(snapshot.data['results'][1]['title'])
                  return myList(snapshot.data['results']);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget myList(movies) {
    return Expanded(
        child: ListView.builder(
            itemCount: movies.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return InkWell(
                child: Row(
                  children: <Widget>[
                    Expanded(flex: 2, child: buildImage(movies, i)),
                    Expanded(flex: 3, child: buildInfo(movies, i)),
                  ],
                ),
                onTap: () {},
              );
            }));
  }

  Widget buildImage(movies, int i) {
    return Container(
      width: 100,
      height: 120,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: mainColor, blurRadius: 8, offset: new Offset(2.0, 5.0))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imageUrl + movies[i]['poster_path'],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildInfo(movies, int i) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              movies[i]['title'],
              style: TextStyle(color: mainColor, fontSize: 18, fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(
            movies[i]['overview'],
            style: TextStyle(color: Colors.blueGrey, fontSize: 12),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
