import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teskura/data/data.dart';
import 'package:teskura/screens/items_list_screen.dart';
import 'package:teskura/widgets/list_card.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User _user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    context.read<Data>().fetchRooms(uid: _user.uid);
    super.initState();
  }

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
                child: Image.network(_user.photoURL),
                radius: 40.0,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'Hello ${_user.displayName}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: 300.0,
              child: Consumer<Data>(
                builder: (_, data, __) => ListView.separated(
                  itemCount: data.rooms.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final child = OpenContainer(
                      transitionType: ContainerTransitionType.fade,
                      openBuilder: (context, _) {
                        return ItemsListScreen(data.rooms[index]);
                      },
                      closedBuilder: (context, _) =>
                          ListCard(data.rooms[index]),
                    );

                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: child,
                      );
                    }

                    return child;
                  },
                  separatorBuilder: (_, __) => SizedBox(width: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
