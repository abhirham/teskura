import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teskura/constants.dart';
import 'package:teskura/screens/login_screen.dart';
import 'package:teskura/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = "welcomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Teskura.',
                    style: GoogleFonts.dosis(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Spacer(),
                Image.asset('images/groceries.png'),
                Spacer(),
                Hero(
                  tag: 'loginButton',
                  child: CustomButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    buttonColor: kCustomGreenColor,
                    fontColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  text: 'Signup',
                  onPressed: () {},
                  buttonColor: Colors.white,
                  fontColor: Colors.black,
                )
              ],
            ),
          ),
        ));
  }
}
