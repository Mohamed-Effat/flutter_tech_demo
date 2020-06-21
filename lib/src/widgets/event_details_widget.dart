import 'package:flutter/material.dart';

import '../models/event_model.dart';

class DetailsWidget extends StatelessWidget {
  final EventModel event;

  DetailsWidget(this.event);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("عن الدورة"),
          Text(event.occasionDetail),
          Divider(),
        ],
      ),
    );
  }
}
