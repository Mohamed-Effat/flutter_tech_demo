import 'package:flutter/material.dart';

import '../mixins/intl_mixin.dart';
import '../models/event_model.dart';

class MetaInfoWidget extends StatelessWidget with IntlMixin {
  final EventModel event;

  MetaInfoWidget(this.event);

  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '#' + event.interest,
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8),
          Text(
            event.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Icon(Icons.date_range),
              SizedBox(width: 8),
              Text(formatDate(event.date)),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(width: 8),
              Text(event.address),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
