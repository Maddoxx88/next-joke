import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:next_joke_bloc/bloc/model/joke_model.dart';
import 'package:next_joke_bloc/res/strings/strings.dart';

abstract class JokeRepository {
  Future<Joke> fetchJoke();
}

class JokeRepositoryImpl implements JokeRepository {
  
  
  @override
  Future<Joke> fetchJoke() async {

    final response =
      await http.get(AppStrings.randomJokeUrl);

  if (response.statusCode == 200) {
    return Joke.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Joke');
  }
  }



}