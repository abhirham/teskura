import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teskura/screens/items_list_screen.dart';
import 'package:teskura/widgets/list_card.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "homeScreen";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffF7B352),
            Color(0xffF05C72),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: CircleAvatar(
                child: Image.network(_auth.currentUser.photoURL),
                radius: 40.0,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Hello ${_auth.currentUser.displayName}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 300.0,
              child: ListView.separated(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return SizedBox(width: 20.0);
                  }
                  return OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    openBuilder: (context, _) => ItemsListScreen(),
                    closedBuilder: (context, _) => ListCard(),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(width: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
