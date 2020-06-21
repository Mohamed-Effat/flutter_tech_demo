import 'package:flutter/material.dart';
import 'event_bloc.dart';
export 'event_bloc.dart';

class EventsProvider extends InheritedWidget {
  final EventsBloc bloc;

  EventsProvider({Key key, Widget child})
      : bloc = EventsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static EventsBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EventsProvider>().bloc;
  }
}
