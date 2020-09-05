import 'package:flutter/material.dart';
import 'package:teskura/models/room.dart';

class ListCard extends StatelessWidget {
  final Room room;

  ListCard(this.room);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(7.0),
      child: Container(
        height: 300.0,
        width: 200.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(room.name),
              Spacer(),
              Text('10 Items'),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
