import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teskura/data/user_store.dart';
import 'package:teskura/utilities/constants.dart';

class PersonalDetailsScreen extends StatefulWidget {
  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  String userName;
  final User _user = FirebaseAuth.instance.currentUser;

  Function handleButtonClick(UserStore userStore) {
    if (userName == null || userName.length == 0) {
      return null;
    }

    return () {
      userStore.createUser(name: userName, uid: _user.uid);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/breakfast.png'),
            TextField(
              decoration: InputDecoration(labelText: 'User Name'),
              onChanged: (val) {
                setState(() {
                  userName = val;
                });
              },
            ),
            Consumer<UserStore>(
              builder: (_, userStore, __) => MaterialButton(
                color: kCustomGreenColor,
                disabledColor: Color.fromRGBO(16, 172, 132, 0.2),
                child: Text('Sign Up'),
                textColor: Colors.white,
                onPressed: handleButtonClick(userStore),
              ),
            )
          ],
        ),
      ),
    );
  }
}
