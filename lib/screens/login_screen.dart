import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:teskura/services/auth.dart';

const TextStyle textStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

class LoginScreen extends StatelessWidget {
  static String id = "loginScreen";

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    _auth.signInWithGoogle();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomInput extends StatelessWidget {
  CustomInput({@required this.hint, this.obscureText = false});

  final String hint;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
