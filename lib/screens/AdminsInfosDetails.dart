import 'dart:io';

import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/RegistrationAdmin_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/widgets/button.dart';
import 'package:firebase_test/widgets/button1.dart';
import 'package:firebase_test/widgets/button2.dart';
import 'package:flutter/physics.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import '../widgets/my_button.dart';

import 'ClientsInfoDetails_screen.dart';

class AdminsInfosScreen extends StatefulWidget {
  static const String ScreenRoute = 'AdminsInfosDetails_screen';
  final String fullname;
  final String email;
  final String im;

  const AdminsInfosScreen({
    Key? key,
    required this.fullname,
    required this.email,
    required this.im,
  }) : super(key: key);

  @override
  State<AdminsInfosScreen> createState() => _AdminsInfosScreenState();
}

class _AdminsInfosScreenState extends State<AdminsInfosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Admin Informations",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 35,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Personal Data",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 50),
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      "${widget.fullname}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 90),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(left: 35),
                    child: Text(
                      "${widget.email}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Text(
                      "Profile picture",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  CircleAvatar(
                    radius: 70, // Image radius
                    backgroundImage: NetworkImage('${widget.im}'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
