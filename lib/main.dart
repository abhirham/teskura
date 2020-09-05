import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teskura/utilities/constants.dart';
import 'package:teskura/data/data.dart';
import 'package:teskura/data/user_store.dart';
import 'package:teskura/screens/container_screen.dart';
import 'package:teskura/screens/login_screen.dart';
import 'package:teskura/screens/personal_details_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider.value(
            value: FirebaseAuth.instance.authStateChanges(),
            child: Consumer<User>(
              builder: (_, user, __) {
                return renderInitial(user);
              },
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}

class renderInitial extends StatelessWidget {
  final User user;

  renderInitial(this.user);

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return MaterialApp(
        home: LoginScreen(),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Data>(
          create: (_) => Data(),
        ),
        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          primaryColor: kCustomGreenColor,
        ),
        home: MyFutureBuilder(user: user),
      ),
    );
  }
}

class MyFutureBuilder extends StatefulWidget {
  const MyFutureBuilder({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  _MyFutureBuilderState createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  Future _future;

  @override
  void initState() {
    setState(() {
      _future = context.read<UserStore>().fetchUserData(widget.user.uid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (_, __) => Consumer<UserStore>(
        builder: (_, userStore, __) {
          if (userStore.user == null) {
            return PersonalDetailsScreen();
          }
          return ContainerScreen();
        },
      ),
    );
  }
}
