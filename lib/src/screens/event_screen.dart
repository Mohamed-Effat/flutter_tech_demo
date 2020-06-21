import 'package:flutter/material.dart';

import '../blocs/event_provider.dart';
import '../models/event_model.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/event_details_widget.dart';
import '../widgets/maker_info_widget.dart';
import '../widgets/meta_info_widget.dart';
import '../widgets/payment_widget.dart';

class EventScreen extends StatelessWidget {
  Widget build(context) {
    final eventsBloc = EventsProvider.of(context);

    return buildEvent(eventsBloc);
  }

  Widget buildEvent(EventsBloc bloc) {
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.event,
        builder: (context, AsyncSnapshot<EventModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselWidget(snapshot.data.img),
                  MetaInfoWidget(snapshot.data),
                  MakerInfoWidget(snapshot.data),
                  DetailsWidget(snapshot.data),
                  PaymentWidget(snapshot.data.reserveTypes),
                  FlatButton(
                    onPressed: (){},
                    child: Text("قم بالحجز الأن"),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
