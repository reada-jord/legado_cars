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

class CommandeScreen extends StatefulWidget {
  final String value;
  final String brand;
  final String name;
  final String color;
  final String description;
  final String engine;
  final String power;
  final String fuel;
  final String seats;
  final String im;
  final String im1;
  final String im2;
  final int prix;
  static const String ScreenRoute = 'Commande_screen';
  const CommandeScreen({
    Key? key,
    required this.color,
    required this.value,
    required this.brand,
    required this.name,
    required this.description,
    required this.engine,
    required this.power,
    required this.fuel,
    required this.seats,
    required this.im,
    required this.im1,
    required this.im2,
    required this.prix,
  }) : super(key: key);

  @override
  State<CommandeScreen> createState() => _CommandeScreenState();
}

class _CommandeScreenState extends State<CommandeScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 206, 43, 1),
          toolbarHeight: 200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
          title: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Image.network('${widget.im}',
                        width: 300, height: 160, fit: BoxFit.contain),
                    Image.network('${widget.im1}',
                        width: 300, height: 160, fit: BoxFit.contain),
                    Image.network('${widget.im2}',
                        width: 300, height: 160, fit: BoxFit.contain),
                  ],
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 15),
                      child: Text(
                        "${widget.brand}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 120, top: 23),
                          child: Text(
                            "${widget.prix}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Text(
                            "Dhs",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 23),
                          child: Text(
                            "/day",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 235),
                  child: Text(
                    '${widget.name}',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "${widget.description}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(189, 189, 189, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240),
                  child: Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Image.asset(
                                  'images/i1.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${widget.engine}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white,
                                width: 0,
                                style: BorderStyle.solid), //Border.all
                            /*** The BorderRadius widget is here ***/
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            //BorderRadius.all
                          ), //BoxDecoration
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Image.asset(
                                  'images/i2.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      "${widget.power}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Km/h",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white,
                                width: 0,
                                style: BorderStyle.solid), //Border.all
                            /*** The BorderRadius widget is here ***/
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            //BorderRadius.all
                          ), //BoxDecoration
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Image.asset(
                                  'images/i3.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, top: 3),
                                child: Row(
                                  children: [
                                    Text(
                                      "${widget.fuel}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "L",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white,
                                width: 0,
                                style: BorderStyle.solid), //Border.all
                            /*** The BorderRadius widget is here ***/
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            //BorderRadius.all
                          ), //BoxDecoration
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Image.asset(
                                  'images/i4.png',
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${widget.seats}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white,
                                width: 0,
                                style: BorderStyle.solid), //Border.all
                            /*** The BorderRadius widget is here ***/
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            //BorderRadius.all
                          ), //BoxDecoration
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text(
                    'Pick a date',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: TextField(
                    controller: dateinput,

                    //editing controller of this TextField

                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14.0),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      hintText: 'Pickup date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd ').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text(
                    'Pick a date',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: TextField(
                    controller: dateinput1,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14.0),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      hintText: 'drop off date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput1.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                MyButton(
                    color: Color.fromRGBO(255, 206, 43, 1),
                    title: 'Register',
                    onPressed: () async {
                      var collection =
                          FirebaseFirestore.instance.collection('Commandes');
                      var querySnapshot = await collection.get();
                      DateFormat inputFormat = DateFormat('yyyy-MM-dd');
                      DateTime input2 = inputFormat.parse(dateinput1.text);
                      DateTime input1 = inputFormat.parse(dateinput.text);
                      var now = new DateTime.now();
                      var formatter = new DateFormat('yyyy-MM-dd');
                      String formattedDate = formatter.format(now);
                      DateTime da = inputFormat.parse(formattedDate);

                      for (var doc in querySnapshot.docs) {
                        Map<String, dynamic> data = doc.data();
                        DateTime db = inputFormat.parse(data['date_debut']);
                        DateTime df = inputFormat.parse(data['date_fin']);
                        if (data['id_car'] == widget.value) {
                          if (input2.isAfter(da) && input1.isAfter(da)) {
                            if (input2.isBefore(db) || input1.isAfter(df)) {
                              int days = input2.difference(input1).inDays;
                              int pri = widget.prix * days;
                              var rr = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new DetailScreen(
                                  id: widget.value,
                                  im: widget.im,
                                  dbj: DateFormat.d().format(input1),
                                  dbm: DateFormat.MMM().format(input1),
                                  dfj: DateFormat.d().format(input2),
                                  dfm: DateFormat.MMM().format(input2),
                                  db: dateinput.text,
                                  df: dateinput1.text,
                                  days: days,
                                  brand: widget.brand,
                                  name: widget.name,
                                  color: widget.color,
                                  power: widget.power,
                                  seat: widget.seats,
                                  fuel: widget.fuel,
                                  prix: pri,
                                ),
                              );
                              Navigator.of(context).push(rr);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromRGBO(255, 206, 43, 1),
                                      title: Text(
                                        'ERRRRRRRRRREUR',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromRGBO(34, 34, 34, 1)),
                                      ),
                                    );
                                  });
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Color.fromRGBO(255, 206, 43, 1),
                                  title: Text(
                                    'ERRRRRRRRRREUR date ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(34, 34, 34, 1)),
                                  ),
                                );
                              },
                            );
                          }
                        }
                      }
                      ;
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
