import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../models/event_model.dart';
import 'repository.dart';

final _root = 'https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34';

class EventsApiProvider implements Source {
  Client client = Client();

  Future<EventModel> fetchEvent() async {
    final response = await client.get('$_root');
    final parsedJson = json.decode(response.body);

    return EventModel.fromJson(parsedJson);
  }
}
