import 'dart:io';

import 'package:firebase_test/screens/AdminsInfosDetails.dart';
import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/InfosClientDetail_screen.dart';
import 'package:firebase_test/screens/RegistrationAdmin_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/widgets/button.dart';
import 'package:firebase_test/widgets/button1.dart';
import 'package:firebase_test/widgets/button2.dart';
import 'package:firebase_test/widgets/button4.dart';
import 'package:firebase_test/widgets/button6.dart';
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

class InfosClientScreen extends StatefulWidget {
  final String id;
  final String email;
  final String fullname;
  final String phone;
  final String cin;
  final String im;
  final String im2;
  final String im3;
  final String im4;

  const InfosClientScreen({
    Key? key,
    required this.id,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.cin,
    required this.im,
    required this.im2,
    required this.im3,
    required this.im4,
  }) : super(key: key);

  @override
  State<InfosClientScreen> createState() => _InfosClientScreenState();
}

class _InfosClientScreenState extends State<InfosClientScreen> {
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
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 55, top: 20),
                    child: Text(
                      "Personal Informations",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 250),
                    child: Text(
                      "Email:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 120),
                    child: Text(
                      "${widget.email}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 210),
                    child: Text(
                      "Full name:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 166),
                    child: Text(
                      "${widget.fullname}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 170),
                    child: Text(
                      "Phone number:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 190),
                    child: Text(
                      "${widget.phone}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 75),
                    child: Text(
                      "Nationale Identiy Number:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 220),
                    child: Text(
                      "${widget.cin}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 150),
                    child: Text(
                      "Nationale Identiy:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: InteractiveViewer(
                        panEnabled: false, // Set it to false
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.5,
                        maxScale: 3,
                        child: Image.network(
                          "${widget.im}",
                          width: 350,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: InteractiveViewer(
                        panEnabled: false, // Set it to false
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.5,
                        maxScale: 3,
                        child: Image.network(
                          "${widget.im2}",
                          width: 350,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 150),
                    child: Text(
                      "Driving licence: ",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: InteractiveViewer(
                        panEnabled: false, // Set it to false
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.5,
                        maxScale: 3,
                        child: Image.network(
                          "${widget.im3}",
                          width: 350,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      child: InteractiveViewer(
                        panEnabled: false, // Set it to false
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.5,
                        maxScale: 3,
                        child: Image.network(
                          "${widget.im4}",
                          width: 350,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 210),
                    child: MyButton6(
                        color: Color.fromRGBO(249, 180, 1, 1),
                        title: 'Edit',
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new InfosClientDetail(
                                    fullname: widget.fullname,
                                    phone: widget.phone,
                                    cin: widget.cin,
                                  ));

                          Navigator.of(context).push(route);
                        }),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
