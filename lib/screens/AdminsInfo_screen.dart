import 'dart:io';

import 'package:firebase_test/screens/AdminsInfosDetails.dart';
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

class AdminsInfo extends StatefulWidget {
  static const String ScreenRoute = 'AdminsInfo_screen';
  const AdminsInfo({Key? key}) : super(key: key);

  @override
  State<AdminsInfo> createState() => _AdminsInfoState();
}

class _AdminsInfoState extends State<AdminsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 190, top: 15, right: 5),
            child: button2(
                width: 200,
                height: 40,
                color: Color.fromRGBO(154, 153, 238, 1),
                title: "New Admin",
                onPressed: () {
                  Navigator.pushNamed(
                      context, RegistrationAdminScreen.ScreenRoute);
                }),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(192, 192, 192, 1))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "Full Name",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    Text(
                      "Email",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          infos(),
        ],
      ),
    );
  }
}

class infos extends StatefulWidget {
  const infos({Key? key}) : super(key: key);

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {
  @override
  static int r = 1;
  final Stream<QuerySnapshot> _voituresStream = FirebaseFirestore.instance
      .collection('users')
      .where('type', isEqualTo: r)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _voituresStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return ListTile(
              title: new FlatButton(
                  onPressed: () async {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new AdminsInfosScreen(
                              fullname: data['fullname'],
                              email: data['email'],
                              im: data['profilemage'],
                            ));

                    Navigator.of(context).push(route);
                  },
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            data['fullname'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            data['email'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Container(
                            child: new IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        backgroundColor:
                                            Color.fromRGBO(154, 153, 238, 1),
                                        title: Column(
                                          children: [
                                            Text(
                                              'Are you sure to delete this user',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Row(
                                                children: [
                                                  button1(
                                                    width: 20,
                                                    height: 10,
                                                    color: Colors.white,
                                                    title: "Cancel",
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(null);
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  button1(
                                                      width: 70,
                                                      height: 10,
                                                      color: Colors.white,
                                                      title: "OK",
                                                      onPressed: () {
                                                        final _auth =
                                                            FirebaseAuth
                                                                .instance;
                                                        final User? user =
                                                            _auth.currentUser;
                                                        final _uid = user?.uid;
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection("users")
                                                            .doc(_uid)
                                                            .delete();
                                                        Navigator.of(context)
                                                            .pop(null);
                                                      }),
                                                ],
                                              ),
                                            )
                                          ],
                                        ));
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            );
          }).toList(),
        );
      },
    );
  }
}
