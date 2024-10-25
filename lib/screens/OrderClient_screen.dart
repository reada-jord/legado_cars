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
import 'OrderClientDetail_screen.dart';

class OrderClientScreen extends StatefulWidget {
  final id;
  const OrderClientScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderClientScreen> createState() => _OrderClientScreenState();
}

class _OrderClientScreenState extends State<OrderClientScreen> {
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
      body: Column(
        children: [
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
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
                      width: 30,
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
          infos(id: widget.id),
        ],
      ),
    );
  }
}

class infos extends StatefulWidget {
  final id;
  const infos({Key? key, required this.id}) : super(key: key);

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {
  @override
  static late String r = "erde";
  void initState() {
    r = widget.id;
    super.initState();
  }

  final Stream<QuerySnapshot> _voituresStream = FirebaseFirestore.instance
      .collection('Commandes')
      .where('id_client', isEqualTo: r)
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
              title: FlatButton(
                  onPressed: () async {
                    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
                    DateTime input1 = inputFormat.parse(data['date_debut']);
                    DateTime input2 = inputFormat.parse(data['date_fin']);

                    var collection =
                        FirebaseFirestore.instance.collection('Voitures');
                    var querySnapshot = await collection.get();
                    for (var doc in querySnapshot.docs) {
                      Map<String, dynamic> dataa = doc.data();
                      if (dataa['id'] == data['id_car']) {
                        var collectionn =
                            FirebaseFirestore.instance.collection('Commandes');
                        var querySnapshott = await collectionn.get();
                        for (var docc in querySnapshott.docs) {
                          Map<String, dynamic> dataaa = docc.data();
                          if (docc['id'] == data['id']) {
                            var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new OrderClientDetailScreen(
                                      id: docc.id,
                                      dbj: DateFormat.d().format(input1),
                                      dbm: DateFormat.MMM().format(input1),
                                      dfj: DateFormat.d().format(input2),
                                      dfm: DateFormat.MMM().format(input2),
                                      name: data['name_car'],
                                      brand: dataa['brand'],
                                      im: dataa['voitureimg1'],
                                      db: data['date_debut'],
                                      df: data['date_fin'],
                                      color: dataa['color'],
                                      power: dataa['power'],
                                      seat: dataa['seats'],
                                      fuel: dataa['full'],
                                      prix: data['prix_total'],
                                    ));
                            Navigator.of(context).push(route);
                          }
                        }
                      }
                    }
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            data['name_car'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            data['date_debut'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            data['date_fin'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
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
