import 'package:flutter/material.dart';

import '../models/event_model.dart';

class MakerInfoWidget extends StatelessWidget {
  final EventModel event;

  MakerInfoWidget(this.event);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    "https://skillzycp.com/upload/trainer/389_BaseImage_636896408382239890.jpg"),
              ),
              SizedBox(width: 8),
              Text(event.trainerName),
            ],
          ),
          Text(event.trainerInfo),
          Divider(),
        ],
      ),
    );
  }
}
