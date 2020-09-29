import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:thenextjoke/model/Joke.dart';

Future<Joke> fetchJoke() async {
  final response = await http.get('https://official-joke-api.appspot.com/random_joke');

  if(response.statusCode == 200) {
    return Joke.fromJson(json.decode(response.body));
  }
  else {
   throw Exception('Failed to load Joke');
  }
}

