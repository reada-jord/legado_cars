import 'package:firebase_test/screens/Addvoitureadmin_screen.dart';
import 'package:firebase_test/screens/AdminsInfosDetails.dart';
import 'package:firebase_test/screens/CarAdmin_screen.dart';
import 'package:firebase_test/screens/ClientsInfoDetails_screen.dart';
import 'package:firebase_test/screens/ClientsInfo_screen.dart';
import 'package:firebase_test/screens/CommandeAdmin_screen.dart';
import 'package:firebase_test/screens/Commande_screen.dart';
import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/RegistrationAdmin_screen.dart';

import 'package:firebase_test/screens/bottombar_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/screens/login_screen.dart';

import 'package:firebase_test/screens/registration_screen.dart';
import 'package:firebase_test/screens/test_screen.dart';
import 'package:firebase_test/screens/voitures_screen.dart';

import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'message me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: homePage(),
      initialRoute: launchScreen.ScreenRoute,
      routes: {
        VoituresScreen.ScreenRoute: (context) => VoituresScreen(),
        TestScreen.ScreenRoute: (context) => TestScreen(),
        launchScreen.ScreenRoute: (context) => launchScreen(),
        RegistrationScreen.ScreenRoute: (context) => RegistrationScreen(),
        Addvoitureadmin.ScreenRoute: (context) => Addvoitureadmin(),
        BottomBarScreen.ScreenRoute: (context) => BottomBarScreen(),
        ClientsInfo.ScreenRoute: (context) => ClientsInfo(),
        RegistrationAdminScreen.ScreenRoute: (context) =>
            RegistrationAdminScreen(),
        CommandesAdminScreen.ScreenRoute: (context) => CommandesAdminScreen(),
        CarAdminScreen.ScreenRoute: (context) => CarAdminScreen(),
      },
    );
  }
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VoitureInformation(),
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
              title: Text(data['brand']),
            );
          }).toList(),
        );
      },
    );
  }
}
