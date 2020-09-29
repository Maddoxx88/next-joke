import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:next_joke_bloc/bloc/model/joke_model.dart';

abstract class JokeState extends Equatable {}

class JokeInitialState extends JokeState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class JokeLoadingState extends JokeState {
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class JokeLoadedState extends JokeState {

  Joke futureJoke;

  JokeLoadedState({ @required this.futureJoke });

  @override
  // TODO: implement props
  List<Object> get props => [futureJoke];

}

class JokeErrorState extends JokeState {

  String message;

  JokeErrorState({ @required this.message });

  @override
  // TODO: implement props
  List<Object> get props => [message];

}