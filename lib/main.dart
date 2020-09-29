import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_joke_bloc/bloc/joke_bloc.dart';
import 'package:next_joke_bloc/bloc/repository/joke_repository.dart';
import 'package:next_joke_bloc/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JokeFetch',
      home: BlocProvider(
        create: (context) => JokeBloc(repository: JokeRepositoryImpl()),
        child: Home(),
        ),
    );
  }
}

