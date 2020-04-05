import 'package:flutter/material.dart';
import 'package:teskura/constants.dart';
import 'package:teskura/screens/container_screen.dart';
import 'package:teskura/widgets/custom_button.dart';

const TextStyle textStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

class LoginScreen extends StatefulWidget {
  static final String id = "loginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

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
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Username',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: rememberMe,
                    activeColor: kCustomGreenColor,
                    onChanged: (val) {
                      setState(() {
                        rememberMe = val;
                      });
                    },
                  ),
                  Text('Remember Me', style: textStyle),
                  Spacer(),
                  Text('Forgot password?', style: textStyle)
                ],
              ),
              Hero(
                tag: 'loginButton',
                child: CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ContainerScreen.id);
                  },
                  buttonColor: kCustomGreenColor,
                  text: 'Login',
                  fontColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dont have an account?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: kCustomGreenColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
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
