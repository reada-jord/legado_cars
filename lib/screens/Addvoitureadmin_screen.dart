import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import '../widgets/my_button.dart';

class Addvoitureadmin extends StatefulWidget {
  static const String ScreenRoute = 'addvoitureadmin_screen';
  const Addvoitureadmin({Key? key}) : super(key: key);

  @override
  State<Addvoitureadmin> createState() => _AddvoitureadminState();
}

class _AddvoitureadminState extends State<Addvoitureadmin> {
  File _pickedImage = File('your initial file');
  File _pickedImage2 = File('your initial file');
  File _pickedImage3 = File('your initial file');

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  void _pickImageCameraa() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage2 = pickedImageFile;
    });
  }

  void _pickImageCameraaa() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage3 = pickedImageFile;
    });
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  void _pickImageGalleryy() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage2 = pickedImageFile;
    });
  }

  void _pickImageGalleryyy() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage3 = pickedImageFile;
    });
  }

  void _remove() {
    setState(() {
      _pickedImage = File('your initial file');
    });
  }

  void _removee() {
    setState(() {
      _pickedImage2 = File('your initial file');
    });
  }

  void _removeee() {
    setState(() {
      _pickedImage3 = File('your initial file');
    });
  }

  late String brand;
  late String name;
  late String prix;
  late String color;
  late String descripton;
  late String fuel;
  late String engine;
  late String power;
  late String full;
  late String seats;
  late String doors;
  late String gearbox;
  late String bluetooth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Add new car",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 30,
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
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 140, top: 30),
                  child: Text(
                    "Informations",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230, top: 26),
                  child: Text(
                    "Brand",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      brand = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230, top: 26),
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130, top: 26),
                  child: Text(
                    "Price With Dirham",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      prix = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240, top: 26),
                  child: Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      color = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 190, top: 26),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      descripton = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10, top: 100),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 185, top: 30),
                  child: Text(
                    "Features",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 245, top: 26),
                  child: Text(
                    "Fuel",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      fuel = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.local_gas_station),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(196, 196, 196, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220, top: 26),
                  child: Text(
                    "Engine",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      engine = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'images/vv1.png',
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130, top: 26),
                  child: Text(
                    "Power with Km/h",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      power = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'images/vv3.png',
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240, top: 26),
                  child: Text(
                    "Full",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      full = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'images/vv4.png',
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220, top: 26),
                  child: Text(
                    "Seats",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      seats = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'images/vv5.png',
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 215, top: 26),
                  child: Text(
                    "Doors",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      doors = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'images/vv6.png',
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 185, top: 26),
                  child: Text(
                    "Gear box",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      gearbox = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(
                        'images/vv7.png',
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 26),
                  child: Text(
                    "Bluetooth",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    onChanged: (value) {
                      bluetooth = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.bluetooth),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(152, 189, 255, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 35),
                  child: Text(
                    "Photos",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 155, top: 26),
                  child: Text(
                    "First Picture :",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 180),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Color.fromRGBO(196, 196, 196, 1),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: _pickedImage == null
                              ? null
                              : FileImage(_pickedImage),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: 70,
                        child: RawMaterialButton(
                          fillColor: Color.fromRGBO(152, 189, 255, 1),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(4.0),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Choose option',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(34, 34, 34, 1)),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: _pickImageCamera,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _pickImageGallery,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.image,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _remove,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.remove_circle,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 130, top: 32),
                  child: Text(
                    "Second Picture :",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 180),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Color.fromRGBO(196, 196, 196, 1),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: _pickedImage2 == null
                              ? null
                              : FileImage(_pickedImage2),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: 70,
                        child: RawMaterialButton(
                          fillColor: Color.fromRGBO(152, 189, 255, 1),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(4.0),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Choose option',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(34, 34, 34, 1)),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: _pickImageCameraa,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _pickImageGalleryy,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.image,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _removee,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.remove_circle,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150, top: 32),
                  child: Text(
                    "Third Picture :",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 180),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Color.fromRGBO(196, 196, 196, 1),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          backgroundImage: _pickedImage3 == null
                              ? null
                              : FileImage(_pickedImage3),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: 70,
                        child: RawMaterialButton(
                          fillColor: Color.fromRGBO(152, 189, 255, 1),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(4.0),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Choose option',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(34, 34, 34, 1)),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            onTap: _pickImageCameraaa,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.camera,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _pickImageGalleryyy,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.image,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: _removeee,
                                            splashColor:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.remove_circle,
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                  ),
                                                ),
                                                Text(
                                                  'Remove',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          34, 34, 34, 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                    color: Color.fromRGBO(154, 153, 238, 1),
                    title: 'Register',
                    onPressed: () async {
                      try {
                        String _randomString =
                            math.Random().nextInt(9999).toString() +
                                math.Random().nextInt(9999).toString() +
                                math.Random().nextInt(9999).toString();
                        String url;
                        String url1;
                        String url2;
                        final ref = FirebaseStorage.instance
                            .ref()
                            .child('voitureimg1')
                            .child('voitureimg1' + _randomString + '.jpg');
                        await ref.putFile(_pickedImage);
                        url = await ref.getDownloadURL();
                        final ref2 = FirebaseStorage.instance
                            .ref()
                            .child('VoituresImages1')
                            .child('imagevoiture2' + _randomString + '.jpg');
                        await ref2.putFile(_pickedImage2);
                        url1 = await ref2.getDownloadURL();
                        final ref3 = FirebaseStorage.instance
                            .ref()
                            .child('VoituresImages3')
                            .child('imagevoiture3' + _randomString + '.jpg');
                        await ref3.putFile(_pickedImage3);
                        url2 = await ref3.getDownloadURL();
                        await FirebaseFirestore.instance
                            .collection('Voitures')
                            .add({
                          'id': _randomString,
                          'brand': brand,
                          'name': name,
                          'prix': prix,
                          'color': color,
                          'descripton': descripton,
                          'fuel': fuel,
                          'engine': engine,
                          'power': power,
                          'full': full,
                          'seats': seats,
                          'doors': doors,
                          'gearbox': gearbox,
                          'bluetooth': bluetooth,
                          'voitureimg1': url,
                          'voitureimg2': url1,
                          'voitureimg3': url2,
                        });
                      } catch (e) {}
                    }),
                SizedBox(
                  height: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
