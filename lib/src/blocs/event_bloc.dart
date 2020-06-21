import 'dart:async';
import 'dart:io';

import 'package:rxdart/rxdart.dart';

import '../models/event_model.dart';
import '../resources/repository.dart';

class EventsBloc {
  final _repository = Repository();
  final _fetchEvent =
      PublishSubject<EventModel>(); //normal broadcast streamController.

  // Getters to Streams
  Observable<EventModel> get event => _fetchEvent.stream;

  fetchEvent() async {
    try {
      final event = await _repository.fetchEvent();
      _fetchEvent.sink.add(event);
    } on SocketException catch (e) {
      print('Socket Error: $e');
      //fetchEvent(); //retry
    }
  }

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _fetchEvent.close();
  }
}
