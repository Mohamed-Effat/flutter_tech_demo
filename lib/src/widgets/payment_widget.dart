import 'package:flutter/material.dart';

import '../models/event_model.dart';

class PaymentWidget extends StatelessWidget {
  final List<ReserveTypesModel> reserveTypes;

  PaymentWidget(this.reserveTypes);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("تكلفة الدورة"),
          Column(children: reserveTypes.map(reserveType).toList()),
        ],
      ),
    );
  }
}

Widget reserveType(ReserveTypesModel t) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(t.name),
      Row(
        children: <Widget>[
          Text(t.price.toString()),
          SizedBox(width: 4),
          Text("SAR"),
        ],
      ),
    ],
  );
}
