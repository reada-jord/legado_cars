import 'dart:io';

import 'package:firebase_test/screens/AdminsInfosDetails.dart';
import 'package:firebase_test/screens/CommandeAdminDetail_screen.dart';
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

class CommandesAdminScreen extends StatefulWidget {
  static const String ScreenRoute = 'CommandeAdmin_screen';
  const CommandesAdminScreen({Key? key}) : super(key: key);

  @override
  State<CommandesAdminScreen> createState() => _CommandesAdminScreenState();
}

class _CommandesAdminScreenState extends State<CommandesAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
        title: Text("JORD Reda"),
      ),
      body: Column(
        children: [
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
                      "Car Name",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 47,
                    ),
                    Text(
                      "First day",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Last day",
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
  final Stream<QuerySnapshot> _voituresStream =
      FirebaseFirestore.instance.collection('Commandes').snapshots();

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
              title: FlatButton(
                  onPressed: () async {
                    var collection =
                        FirebaseFirestore.instance.collection('Voitures');
                    var querySnapshot = await collection.get();
                    for (var doc in querySnapshot.docs) {
                      Map<String, dynamic> dataa = doc.data();
                      if (dataa['id'] == data['id_car']) {
                        var collectionn =
                            FirebaseFirestore.instance.collection('users');
                        var querySnapshott = await collectionn.get();
                        for (var docc in querySnapshott.docs) {
                          Map<String, dynamic> dataaa = docc.data();
                          if (dataaa['id'] == data['id_client']) {
                            var collectioni = FirebaseFirestore.instance
                                .collection('Commandes');
                            var querySnapshotss = await collectioni.get();
                            for (var snapshott in querySnapshotss.docs) {
                              if (snapshott['id'] == data['id']) {
                                var route = MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new CommandeAdminDetailScreen(
                                          id: snapshott.id,
                                          db: data['date_debut'],
                                          df: data['date_fin'],
                                          prix: data['prix_total'],
                                          brand: dataa['brand'],
                                          name: data['name_car'],
                                          price: dataa['prix'],
                                          phone: dataaa['phone'],
                                          cin: dataaa['cin'],
                                          im: dataaa['CINImageFont'],
                                          im1: dataaa['CINImageBack'],
                                          im2: dataaa['LicenceFront'],
                                          im3: dataaa['LicenceBack'],
                                          namecar: dataaa['fullname'],
                                        ));

                                Navigator.of(context).push(route);
                              }
                            }
                          }
                        }
                      }
                    }
                  },
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            data['name_car'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            data['date_debut'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            data['date_fin'],
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
