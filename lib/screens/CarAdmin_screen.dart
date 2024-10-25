import 'dart:io';

import 'package:firebase_test/screens/CarAdminDetail_screen.dart';
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

class CarAdminScreen extends StatefulWidget {
  static const String ScreenRoute = 'CarAdmin_screen';
  const CarAdminScreen({Key? key}) : super(key: key);

  @override
  State<CarAdminScreen> createState() => _CarAdminScreenState();
}

class _CarAdminScreenState extends State<CarAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        title: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(152, 189, 255, 1),
                ),
                hintText: 'Enter you ',
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 1),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(80),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(80),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 1),
              child: RaisedButton(
                onPressed: () {},
                color: Color.fromRGBO(34, 34, 34, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: 150,
                  height: 42,
                  child: Text(
                    "Show Cars",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
      ),
      body: VoitureInformation(),
      //Center
    );
  }
}

class VoitureInformation extends StatefulWidget {
  @override
  _VoitureInformation createState() => _VoitureInformation();
}

class _VoitureInformation extends State<VoitureInformation> {
  final Stream<QuerySnapshot> _voituresStream =
      FirebaseFirestore.instance.collection('Voitures').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _voituresStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            return ListTile(
              title: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      child: Builder(builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(),
                          child: SizedBox(
                            height: 145,
                            width: 320,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      data['voitureimg1'],
                                      width: 140,
                                      height: 120,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 10),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 80),
                                        child: Text(
                                          data['name'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'images/V1.png',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  data['gearbox'],
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                'images/V2.png',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      data['full'],
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      "L",
                                                      style: TextStyle(
                                                        fontSize: 5,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                'images/V3.png',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      data['power'],
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      "km/h",
                                                      style: TextStyle(
                                                        fontSize: 5,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                'images/V4.png',
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                  data['seats'],
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, left: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                data['prix'].toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 4),
                                                child: Text(
                                                  "Dhs",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: FlatButton(
                                                  onPressed: () async {
                                                    var collectioni =
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'Voitures');
                                                    var querySnapshotss =
                                                        await collectioni.get();
                                                    for (var snapshott
                                                        in querySnapshotss
                                                            .docs) {
                                                      if (snapshott['id'] ==
                                                          data['id']) {
                                                        var route =
                                                            new MaterialPageRoute(
                                                          builder: (BuildContext context) => new CarAdminDetailScreen(
                                                              id: snapshott.id,
                                                              brand:
                                                                  data['brand'],
                                                              name:
                                                                  data['name'],
                                                              prix:
                                                                  data['prix'],
                                                              color:
                                                                  data['color'],
                                                              description: data[
                                                                  'descripton'],
                                                              fuel:
                                                                  data['fuel'],
                                                              engine: data[
                                                                  'engine'],
                                                              power:
                                                                  data['power'],
                                                              full:
                                                                  data['full'],
                                                              seats:
                                                                  data['seats'],
                                                              doors:
                                                                  data['doors'],
                                                              gear: data[
                                                                  'gearbox'],
                                                              bluetooth: data[
                                                                  'bluetooth'],
                                                              im: data[
                                                                  'voitureimg1'],
                                                              im1: data[
                                                                  'voitureimg2'],
                                                              im2: data[
                                                                  'voitureimg3']),
                                                        );
                                                        Navigator.of(context)
                                                            .push(route);
                                                      }
                                                    }
                                                  },
                                                  child: new Text(
                                                    "Details-->",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromRGBO(152, 189, 255, 1),
                            width: 0,
                            style: BorderStyle.solid), //Border.all
                        /*** The BorderRadius widget is here ***/
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ), //BorderRadius.all
                      ), //BoxDecoration
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
