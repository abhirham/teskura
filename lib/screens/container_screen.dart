import 'package:flutter/material.dart';
import 'package:teskura/constants.dart';
import 'package:teskura/screens/home_screen.dart';
import 'package:teskura/screens/settings_screen.dart';

class ContainerScreen extends StatelessWidget {
  static const String id = 'containerScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
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
