import 'dart:io';

import 'package:firebase_test/screens/Commande_screen.dart';
import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:photo_view/photo_view.dart';
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

class ClientinfosDetails extends StatefulWidget {
  static const String ScreenRoute = 'ClientsInfoDetails_screen';
  final String fullname;
  final String phone;
  final String email;
  final String adress;
  final String cin;
  final String im;
  final String im1;
  final String im2;
  final String im3;
  const ClientinfosDetails({
    Key? key,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.adress,
    required this.cin,
    required this.im,
    required this.im1,
    required this.im2,
    required this.im3,
  }) : super(key: key);

  @override
  State<ClientinfosDetails> createState() => _ClientinfosDetailsState();
}

class _ClientinfosDetailsState extends State<ClientinfosDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Client Informations",
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
                    margin: const EdgeInsets.only(right: 120, top: 15),
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
                    margin: const EdgeInsets.only(right: 190),
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
                    margin: const EdgeInsets.only(right: 140),
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
                    margin: const EdgeInsets.only(right: 145),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 160),
                    child: Text(
                      "${widget.phone}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 220),
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
                    margin: const EdgeInsets.only(right: 87),
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
                    margin: const EdgeInsets.only(right: 85),
                    child: Text(
                      "National identity",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 90),
                    child: Text(
                      "Nationale Identity N° ",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 197),
                    child: Text(
                      "${widget.cin}",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 220),
                    child: Text(
                      "Front:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
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
                    margin: const EdgeInsets.only(right: 220),
                    child: Text(
                      "Back:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      child: InteractiveViewer(
                        panEnabled: false, // Set it to false
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.5,
                        maxScale: 3,
                        child: Image.network(
                          "${widget.im1}",
                          width: 350,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 90),
                    child: Text(
                      "Driving licence ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Container(
                    margin: const EdgeInsets.only(right: 220),
                    child: Text(
                      "Front:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
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
                    margin: const EdgeInsets.only(right: 220),
                    child: Text(
                      "Back:",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(196, 196, 196, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      child: InteractiveViewer(
                        panEnabled: false, // Set it to false
                        boundaryMargin: EdgeInsets.all(100),
                        minScale: 0.5,
                        maxScale: 3,
                        child: Image.network(
                          "${widget.im3}",
                          width: 350,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 26),
                  SizedBox(height: 26),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
