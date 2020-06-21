import 'dart:async';
import 'events_api_provider.dart';
import '../models/event_model.dart';

class Repository {
  List<Source> sources = <Source>[
    EventsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    //todo make offline cache and add it in List<Source> as well
  ];

  Future<EventModel> fetchEvent() async {
    EventModel event;
    var source;

    for (source in sources) {
      event = await source.fetchEvent();
      if (event != null) {  //if the source actually gets the data then don't use any other sources.
        break;
      }
    }

    for (var cache in caches) {
      if (cache != source) { //if the cache is the same as the source then don't duplicate it's item.
        cache.addEvent(event);
      }
    }

    return event;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<EventModel> fetchEvent();
}

abstract class Cache {
  Future<EventModel> fetchEvent();
  Future<int> addEvent(EventModel event);
  Future<int> clear();
}
