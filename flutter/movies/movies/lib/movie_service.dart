import 'dart:convert';
import 'package:http/http.dart' as http;

searchMovies(String text) async {
  final apikey = 'b8c79639';
  final endpoint = 'http://www.omdbapi.com/';

  if (text == "") {
    return [];
  }

  var response = await http.get(endpoint + "?apikey=" + apikey + "&s=" + text);
  final responseJson = json.decode(response.body);
  if (responseJson['Search'] != null) {
    return responseJson['Search']
        .where((movie) => movie['Poster'] != "N/A")
        .toList();
  }

  return [];
}

findMovie(String text) async {
  final apikey = 'b8c79639';
  final endpoint = 'http://www.omdbapi.com/';

  if (text == "") {
    return [];
  }

  var response = await http.get(endpoint + "?apikey=" + apikey + "&i=" + text);
  print(json.decode(response.body));
  return json.decode(response.body);
}
