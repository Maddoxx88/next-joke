import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_joke_bloc/bloc/event/joke_event.dart';
import 'package:next_joke_bloc/bloc/model/joke_model.dart';
import 'package:next_joke_bloc/bloc/repository/joke_repository.dart';
import 'package:next_joke_bloc/bloc/state/joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {

  JokeRepository repository;

  JokeBloc({ @required this.repository }) : super(null);

  @override
  JokeState get initialState => JokeInitialState();

  @override
  Stream<JokeState> mapEventToState(JokeEvent event) async* {
    if (event is FetchJokeEvent ) {
      yield JokeLoadingState();
    }
    try {
      Joke futureJoke = await repository.fetchJoke();
      yield JokeLoadedState(futureJoke: futureJoke);
    } catch (e) {
      yield JokeErrorState(message: e.toString());
    }
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  

}