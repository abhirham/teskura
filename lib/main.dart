import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teskura/constants.dart';
import 'package:teskura/data/tasks.dart';
import 'package:teskura/screens/container_screen.dart';
import 'package:teskura/screens/welcome_screen.dart';

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

Widget renderInitial(User user) {
  if (user == null) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }

  return ChangeNotifierProvider(
    create: (_) => Tasks(),
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: kCustomGreenColor,
      ),
      initialRoute: ContainerScreen.id,
      routes: {
        ContainerScreen.id: (context) => ContainerScreen(),
      },
    ),
  );
}
