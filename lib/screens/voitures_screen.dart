// ignore_for_file: deprecated_member_use

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

class VoituresScreen extends StatefulWidget {
  static const String ScreenRoute = 'voitures_screen';
  const VoituresScreen({Key? key}) : super(key: key);

  @override
  State<VoituresScreen> createState() => _VoituresScreenState();
}

class _VoituresScreenState extends State<VoituresScreen> {
  @override
  Widget build(BuildContext context) {
    //Our app widget tree starts here
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 200,
        title: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 80, top: 10),
                child: Image.asset("images/Logo2.png"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(255, 206, 43, 1),
                ),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Color.fromRGBO(63, 63, 63, 1),
                contentPadding: EdgeInsets.only(left: 10),
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
              padding: EdgeInsets.only(left: 35, top: 1),
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
                    "Show Offers",
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
        backgroundColor: Color.fromRGBO(255, 206, 43, 1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogininterfaceScreen()));
              },
              icon: Icon(
                Icons.account_circle,
                color: Color.fromRGBO(34, 34, 34, 1),
                size: 35,
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),
      ),
      body: VoitureInformation(),
      //Center
    );

    //Scaffold
    //Debug banner is turned off
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
                    padding: const EdgeInsets.only(),
                    child: Container(
                      child: Builder(builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(),
                          child: SizedBox(
                            height: 145,
                            width: 340,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          20), // Image border
                                      child: SizedBox.fromSize(
                                        size:
                                            Size.fromRadius(74), // Image radius
                                        child: Image.network(
                                            data['voitureimg1'],
                                            fit: BoxFit.cover),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 10),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 100),
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
                                                  onPressed: () {
                                                    var route =
                                                        new MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          new CommandeScreen(
                                                              color:
                                                                  data['color'],
                                                              value: data['id'],
                                                              brand:
                                                                  data['brand'],
                                                              name:
                                                                  data['name'],
                                                              description: data[
                                                                  'descripton'],
                                                              engine: data[
                                                                  'gearbox'],
                                                              power:
                                                                  data['power'],
                                                              fuel:
                                                                  data['full'],
                                                              seats:
                                                                  data['seats'],
                                                              im: data[
                                                                  'voitureimg1'],
                                                              im1: data[
                                                                  'voitureimg2'],
                                                              im2: data[
                                                                  'voitureimg3'],
                                                              prix:
                                                                  data['prix']),
                                                    );
                                                    Navigator.of(context)
                                                        .push(route);
                                                  },
                                                  child: new Text(
                                                    "Details-->",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color.fromRGBO(
                                                          255, 206, 43, 1),
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
                            color: const Color(0xFF000000),
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
