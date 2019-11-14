import 'package:flutter/material.dart';
import 'movie_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        routes: {
          MovieDetail.routeName: (context) => MovieDetail(),
        },
        home: Scaffold(
            appBar: new AppBar(title: new Text("Video Search")),
            body: new Movies()));
  }
}

class Movies extends StatefulWidget {
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List _movies = [];

  void _updateMovies(String search) {
    searchMovies(search).then((movies) => setState(() {
          _movies = movies;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
              onChanged: _updateMovies),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: new Text(_movies[index]['Title'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      trailing: new Image.network(
                        _movies[index]['Poster'],
                        fit: BoxFit.cover,
                        height: 100.0,
                        width: 100.0,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetail.routeName,
                            arguments:
                                MovieArguments(_movies[index]['imdbID']));
                      },
                    );
                  }))
        ]);
  }
}

class MovieArguments {
  final String movieId;
  MovieArguments(this.movieId);
}

class MovieDetail extends StatefulWidget {
  // This widget is the root of your application.
  _MovieDetailState createState() => _MovieDetailState();
  static const routeName = '/movies';
}

class _MovieDetailState extends State<MovieDetail> {
  var _movie;
  var _first = true;

  @override
  Widget build(BuildContext context) {
    if (_first) {
      _first = false;
      final MovieArguments args = ModalRoute.of(context).settings.arguments;
      findMovie(args.movieId).then((movie) => setState(() {
            _movie = movie;
          }));
    }
    if (_movie == null) {
      return new MaterialApp(
          home: Scaffold(
              appBar: new AppBar(title: new Text("")), body: new Text("")));
    }

    return new MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
                automaticallyImplyLeading: true,
                title: new Text(_movie["Title"]),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: new Center(
                child: new Column(children: [
              new SizedBox(height: 10),
              new Image.network(
                _movie['Poster'],
                fit: BoxFit.cover,
                height: 400.0,
                width: 400.0,
              ),
              new SizedBox(height: 10),
              new Text("Director",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
              new Text("${_movie['Director']}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              new SizedBox(height: 10),
              new Text("Year",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
              new Text("${_movie['Year']}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              new SizedBox(height: 10),
              new Text("Actors",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
              new Text("${_movie['Actors']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ]))));
  }
}
