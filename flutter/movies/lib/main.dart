import 'package:flutter/material.dart';
import 'movie_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          MovieDetail.routeName: (context) => MovieDetail(),
        },
        home: Scaffold(
            appBar: new AppBar(title: Text("Video Search")), body: Movies()));
  }
}

class Movies extends StatefulWidget {
  MoviesState createState() => MoviesState();
}

class MoviesState extends State<Movies> {
  List movies = [];

  void updateMovies(String search) {
    searchMovies(search).then((m) => setState(() {
          movies = m;
        }));
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w200, color: Colors.black),
            onChanged: updateMovies),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: movies.length,
            itemBuilder: (BuildContext cnt, int index) {
              return ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: new Text(
                    movies[index]['Title'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  trailing: new Image.network(movies[index]['Poster'],
                      height: 100.0, width: 100.0, fit: BoxFit.cover),
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetail.routeName,
                        arguments: MovieArguments(movies[index]['imdbID']));
                  });
            },
          ),
        )
      ],
    );
  }
}

class MovieArguments {
  final String movieId;
  MovieArguments(this.movieId);
}

class MovieDetail extends StatefulWidget {
  MovieDetailState createState() => MovieDetailState();
  static const routeName = "/detail";
}

class MovieDetailState extends State<MovieDetail> {
  var movie;
  var first = true;

  Widget build(BuildContext context) {
    if (first) {
      first = false;
      final MovieArguments args = ModalRoute.of(context).settings.arguments;
      findMovie(args.movieId).then((m) {
        setState(() {
          movie = m;
        });
      });
    }
    if (movie == null) {
      return new MaterialApp(
          home: Scaffold(appBar: AppBar(title: Text("")), body: Text("")));
    }

    return new MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text(movie["Title"]),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: Center(
                child: Column(children: [
              SizedBox(height: 10),
              Image.network(movie['Poster'],
                  fit: BoxFit.cover, height: 400.0, width: 400.0),
              SizedBox(height: 10),
              Text(movie["Director"]),
              SizedBox(height: 10),
              Text(movie["Year"]),
              SizedBox(height: 10),
              Text(movie["Actors"])
            ]))));
  }
}
