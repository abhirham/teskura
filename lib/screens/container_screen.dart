import 'package:flutter/material.dart';
import 'package:teskura/utilities/constants.dart';
import 'package:teskura/screens/home_screen.dart';
import 'package:teskura/screens/settings_screen.dart';
import 'package:teskura/services/auth.dart';

class ContainerScreen extends StatelessWidget {
  static const String id = 'containerScreen';
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _auth.signOut();
            },
          ),
          bottomNavigationBar: TabBar(
            indicatorColor: kCustomGreenColor,
            unselectedLabelColor: Colors.grey,
            labelColor: kCustomGreenColor,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              SettingsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
