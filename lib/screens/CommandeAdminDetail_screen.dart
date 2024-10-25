import 'dart:io';

import 'package:firebase_test/screens/AdminsInfosDetails.dart';
import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/RegistrationAdmin_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/widgets/button.dart';
import 'package:firebase_test/widgets/button1.dart';
import 'package:firebase_test/widgets/button2.dart';
import 'package:firebase_test/widgets/button4.dart';
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

class CommandeAdminDetailScreen extends StatefulWidget {
  final String db;
  final String df;
  final int price;
  final int prix;
  final String brand;
  final String name;
  final String cin;
  final String namecar;
  final String phone;
  final String im;
  final String im1;
  final String im2;
  final String im3;
  final String id;
  const CommandeAdminDetailScreen(
      {Key? key,
      required this.db,
      required this.id,
      required this.df,
      required this.prix,
      required this.price,
      required this.brand,
      required this.namecar,
      required this.phone,
      required this.im,
      required this.im1,
      required this.im2,
      required this.im3,
      required this.cin,
      required this.name})
      : super(key: key);

  @override
  State<CommandeAdminDetailScreen> createState() =>
      _CommandeAdminDetailScreenState();
}

class _CommandeAdminDetailScreenState extends State<CommandeAdminDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(152, 189, 255, 1),
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Order Details",
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
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 225, top: 20),
                      child: Text(
                        "Order",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 180),
                      child: Text(
                        "Pickup date ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 185),
                      child: Text(
                        "${widget.db}",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 169),
                      child: Text(
                        "Drop off date ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 187),
                      child: Text(
                        "${widget.df}",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 245),
                      child: Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 210),
                      child: Text(
                        "${widget.prix} DHS",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 245, top: 20),
                      child: Text(
                        "Car",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 235),
                      child: Text(
                        "Brand",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 195),
                      child: Text(
                        "${widget.brand} ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 230),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 216),
                      child: Text(
                        "${widget.name} ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 230),
                      child: Text(
                        " Price  ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 205),
                      child: Text(
                        "${widget.price}DHS ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 215, top: 20),
                      child: Text(
                        "Client",
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
                        " Full name  ",
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
                        "${widget.namecar} ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 150),
                      child: Text(
                        "Phone number",
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
                        "${widget.phone} ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 130),
                      child: Text(
                        "National Identity ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 196),
                      child: Text(
                        "${widget.cin} ",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      margin: const EdgeInsets.only(right: 210),
                      child: Text(
                        " Papers  ",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 86, right: 86),
                      child: MyButton4(
                          color: Color.fromRGBO(154, 153, 238, 1),
                          title: 'Delete Order',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    backgroundColor:
                                        Color.fromRGBO(154, 153, 238, 1),
                                    title: Column(
                                      children: [
                                        Text(
                                          'Are you sure to delete this commande',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                                                    FirebaseFirestore.instance
                                                        .collection("Commandes")
                                                        .doc("${widget.id}")
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
                          }),
                    )
                  ],
                )
              ],
            )));
  }
}
