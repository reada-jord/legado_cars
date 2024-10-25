import 'dart:io';

import 'package:firebase_test/screens/Commande_screen.dart';
import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/logininterface_screen.dart';
import 'package:firebase_test/screens/welcome_screen.dart';
import 'package:flutter/physics.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/my_button.dart';

class ValidateCommandeScreen extends StatefulWidget {
  final String fullname;
  final String im;
  final String brand;
  final String dbj;
  final String dbm;
  final String dfj;
  final String dfm;

  const ValidateCommandeScreen({
    Key? key,
    required this.fullname,
    required this.im,
    required this.brand,
    required this.dbj,
    required this.dbm,
    required this.dfj,
    required this.dfm,
  }) : super(key: key);

  @override
  State<ValidateCommandeScreen> createState() => _ValidateCommandeScreenState();
}

class _ValidateCommandeScreenState extends State<ValidateCommandeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(249, 180, 1, 1),
        title: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 100, top: 10),
            child: Image.asset("images/Logo2.png"),
          ),
        ),
      ),
      body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(top: 45),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 150,
                      child: Image.network('${widget.im}'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 120),
                      child: Text(
                        "Thank You ",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Text(
                        "You have rent a ${widget.brand} ${widget.fullname} Model from ${widget.dbj}th ${widget.dbm} to ${widget.dfj}th ${widget.dfm}. ",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 100,
                      child: Image.asset('images/contact.png'),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 120),
                      child: Text(
                        "Support 24/24h",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "+212655030283 / JORDRedacontact@gmail.com",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Color.fromRGBO(249, 180, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop(null);
                          },
                          minWidth: 290,
                          height: 52,
                          child: Text(
                            "Back Home",
                            style: TextStyle(
                              color: Color.fromRGBO(34, 34, 34, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
