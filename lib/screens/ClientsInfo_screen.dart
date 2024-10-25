import 'dart:io';

import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
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

class ClientsInfo extends StatefulWidget {
  static const String ScreenRoute = 'ClientsInfo_screen';
  const ClientsInfo({Key? key}) : super(key: key);

  @override
  State<ClientsInfo> createState() => _ClientsInfoState();
}

class _ClientsInfoState extends State<ClientsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(192, 192, 192, 1))),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "Identity N°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Full Name",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Phone N°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
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

      //Center
    );

    //Scaffold
    //Debug banner is turned off
  }
}

class infos extends StatefulWidget {
  const infos({Key? key}) : super(key: key);

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {
  @override
  final Stream<QuerySnapshot> _voituresStream = FirebaseFirestore.instance
      .collection('users')
      .where('type', isEqualTo: 2)
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
                            new ClientinfosDetails(
                              fullname: data['fullname'],
                              phone: data['phone'],
                              email: data['email'],
                              adress: data['adress'],
                              cin: data['cin'],
                              im1: data['CINImageBack'],
                              im: data['CINImageFont'],
                              im2: data['LicenceFront'],
                              im3: data['LicenceBack'],
                            ));

                    Navigator.of(context).push(route);
                  },
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            data['cin'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            data['fullname'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            data['phone'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
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
