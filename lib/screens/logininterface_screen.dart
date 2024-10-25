import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_test/screens/BottomBarClient_screen.dart';
import 'package:firebase_test/screens/OrderClient_screen.dart';
import 'package:firebase_test/screens/bottombar_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/screens/registration_screen.dart';
import 'package:firebase_test/screens/welcome_screen.dart';
import 'package:firebase_test/widgets/button.dart';
import 'package:firebase_test/widgets/button1.dart';
import 'package:flutter/material.dart';
import '../widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:io';

import 'InfosClient_screen.dart';

class LogininterfaceScreen extends StatefulWidget {
  static const String ScreenRoute = 'logininterface_screen';
  const LogininterfaceScreen({Key? key}) : super(key: key);

  @override
  State<LogininterfaceScreen> createState() => _LogininterfaceScreenState();
}

class _LogininterfaceScreenState extends State<LogininterfaceScreen> {
  @override
  bool _obscuretext = true;
  late String email;
  late String password;

  Widget build(BuildContext context) {
    return Stack(
      // <-- STACK AS THE SCAFFOLD PARENT
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Login.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor:
              Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG

          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 200),
                        child: Image.asset("images/Logo.png"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 220),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 215),
                        child: Text(
                          'Your Email',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextField(
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            hintText: 'jord@gmail.com',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(249, 180, 1, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(249, 180, 1, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 185),
                        child: Text(
                          'Your Password',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextField(
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          obscureText: _obscuretext,
                          textAlign: TextAlign.start,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscuretext = !_obscuretext;
                                });
                              },
                              child: Icon(_obscuretext
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hintText: ' ********',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(249, 180, 1, 1),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(249, 180, 1, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: button(
                                width: 100,
                                height: 50,
                                color: Colors.transparent,
                                title: "Skip >",
                                onPressed: () {}),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          button1(
                              width: 200,
                              height: 45,
                              color: Color.fromRGBO(249, 180, 1, 1),
                              title: "Login --->",
                              onPressed: () async {
                                final _auth = FirebaseAuth.instance;
                                _auth
                                    .signInWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((value) async {
                                  final User? user = _auth.currentUser;
                                  final _uid = user?.uid;
                                  var collection = FirebaseFirestore.instance
                                      .collection('users');
                                  var querySnapshot = await collection.get();
                                  for (var doc in querySnapshot.docs) {
                                    Map<String, dynamic> data = doc.data();
                                    if (doc['id'] == _uid && doc['type'] == 1) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomBarScreen()));
                                    } else if (doc['id'] == _uid &&
                                        doc['type'] == 2) {
                                      var route = MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new BottomBarClientScreen(
                                                id: _uid,
                                                email: doc['email'],
                                                fullname: doc['fullname'],
                                                phone: doc['phone'],
                                                cin: doc['cin'],
                                                im: doc['CINImageFont'],
                                                im2: doc['CINImageBack'],
                                                im3: doc['LicenceFront'],
                                                im4: doc['LicenceBack'],
                                              ));

                                      Navigator.of(context).push(route);
                                    }
                                  }
                                }).onError((error, stackTrace) {
                                  print("Error ${error.toString()}");
                                });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      FlatButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email)
                              .then((value) => Navigator.of(context).pop());
                        },
                        child: new Text(
                          "Forget Password ?",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              'Don’t have an account?',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegistrationScreen.ScreenRoute);
                            },
                            child: new Text(
                              "Sign Up Now",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
