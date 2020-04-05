import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
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
              Text('Personal'),
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
