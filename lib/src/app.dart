import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inovolachallengeevents/src/blocs/event_provider.dart';

import 'blocs/event_provider.dart';
import 'screens/event_screen.dart';

class App extends StatelessWidget {
  build(context) {
    //AnnotatedRegion only applies SystemUi changes to it's child tree.
    // this is better than SystemChrome.setSystemUIOverlayStyle as it preserve the style even when popping screens.
    return AnnotatedRegion<SystemUiOverlayStyle>(
      //change the status bar color to transparent.
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: EventsProvider(
        //EventsProvider for the events BloC data.
        child: MaterialApp(
          title: 'Inovola Challenge',
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  fontSizeFactor: 1.1,
                  fontSizeDelta: 2.0,
                  bodyColor: Color(0xff9EA3B7),
                  displayColor: Color(0xff9EA3B7),
                ),
            iconTheme: IconThemeData(
              color: Color(0xff9EA3B7),
            ),
            dividerTheme: DividerThemeData(thickness: 2),
          ),
          onGenerateRoute: routes,
        ),
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        //passing settings to avoid the named routing bug, https://github.com/flutter/flutter/issues/50192
        settings: settings,
        builder: (context) {
          final eventsBloc = EventsProvider.of(context);

          // this is a good position to initialize any data such as the event object from the fetchEvent.
          eventsBloc.fetchEvent();

          return EventScreen();
        },
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
