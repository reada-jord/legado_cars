import 'package:flutter/material.dart';

import 'package:firebase_test/screens/registration_screen.dart';
import '../widgets/my_button.dart';
import 'Login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String ScreenRoute = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/logov.png'),
                ),
                Text(
                  'Message me',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'Sign in',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.ScreenRoute);
              },
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: ' Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.ScreenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
