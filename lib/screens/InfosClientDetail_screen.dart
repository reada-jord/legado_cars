import 'dart:io';

import 'package:firebase_test/screens/AdminsInfosDetails.dart';
import 'package:firebase_test/screens/Detail_screen.dart';
import 'package:firebase_test/screens/RegistrationAdmin_screen.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/widgets/button.dart';
import 'package:firebase_test/widgets/button1.dart';
import 'package:firebase_test/widgets/button2.dart';
import 'package:firebase_test/widgets/button4.dart';
import 'package:firebase_test/widgets/button6.dart';
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

class InfosClientDetail extends StatefulWidget {
  final String fullname;
  final String phone;
  final String cin;

  const InfosClientDetail({
    Key? key,
    required this.fullname,
    required this.phone,
    required this.cin,
  }) : super(key: key);

  @override
  State<InfosClientDetail> createState() => _InfosClientDetailState();
}

class _InfosClientDetailState extends State<InfosClientDetail> {
  File _pickedImage = File('your initial file');
  File _pickedImage2 = File('your initial file');
  File _pickedImage3 = File('your initial file');
  File _pickedImage4 = File('your initial file');

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

  void _pickImageCameraaaa() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage4 = pickedImageFile;
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

  void _pickImageGalleryyyy() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage4 = pickedImageFile;
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

  void _removeeee() {
    setState(() {
      _pickedImage4 = File('your initial file');
    });
  }

  late String cin;
  late String number;
  late String fullname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Information",
            style: TextStyle(
              color: Colors.white,
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
        backgroundColor: Color.fromRGBO(34, 34, 34, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 130, top: 28),
                    child: Text(
                      "Personal Data",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        fullname = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: '${widget.fullname}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
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
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        number = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: '${widget.phone}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
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
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        cin = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.badge),
                        hintText: '${widget.cin}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
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
                    padding: const EdgeInsets.only(right: 20, top: 28),
                    child: Text(
                      "Upload national identity ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 240, top: 20),
                    child: Text(
                      "Front: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            fillColor: Color.fromRGBO(196, 196, 196, 1),
                            child: Icon(Icons.add_a_photo),
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
                                            color:
                                                Color.fromRGBO(34, 34, 34, 1)),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                    padding: const EdgeInsets.only(right: 240, top: 20),
                    child: Text(
                      "Back: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            fillColor: Color.fromRGBO(196, 196, 196, 1),
                            child: Icon(Icons.add_a_photo),
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
                                            color:
                                                Color.fromRGBO(34, 34, 34, 1)),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                    padding: const EdgeInsets.only(right: 70, top: 28),
                    child: Text(
                      "Upload your licence",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 240, top: 20),
                    child: Text(
                      "Front: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            fillColor: Color.fromRGBO(196, 196, 196, 1),
                            child: Icon(Icons.add_a_photo),
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
                                            color:
                                                Color.fromRGBO(34, 34, 34, 1)),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                    padding: const EdgeInsets.only(right: 240, top: 20),
                    child: Text(
                      "Back: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                            backgroundImage: _pickedImage4 == null
                                ? null
                                : FileImage(_pickedImage4),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 100,
                          left: 70,
                          child: RawMaterialButton(
                            fillColor: Color.fromRGBO(196, 196, 196, 1),
                            child: Icon(Icons.add_a_photo),
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
                                            color:
                                                Color.fromRGBO(34, 34, 34, 1)),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            InkWell(
                                              onTap: _pickImageCameraaaa,
                                              splashColor:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                              onTap: _pickImageGalleryyyy,
                                              splashColor:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                              onTap: _removeeee,
                                              splashColor:
                                                  Color.fromRGBO(34, 34, 34, 1),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: MyButton(
                        color: Color.fromRGBO(255, 206, 43, 1),
                        title: 'Register',
                        onPressed: () async {}),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
