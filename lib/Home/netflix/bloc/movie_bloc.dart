import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

import '../model/movie_response.dart';
import '../repositories/repository.dart';

class MovieBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovie(int genre, int miniImdb) async {
    MovieResponse response = await _repository.getMovie(genre, miniImdb);
    _subject.sink.add(response);
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  void drainStream() {
    // _subject.value = MovieResponse(, error);
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final movieBloc = MovieBloc();
