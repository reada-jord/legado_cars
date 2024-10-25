import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_test/screens/welcome_screen.dart';
import 'package:firebase_test/widgets/button3.dart';
import 'package:flutter/material.dart';
import '../widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:io';
import 'dart:math' as math;
import 'Login_screen.dart';

class RegistrationAdminScreen extends StatefulWidget {
  static const String ScreenRoute = 'RegistrationAdmin_screen';
  const RegistrationAdminScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationAdminScreen> createState() =>
      _RegistrationAdminScreenState();
}

class _RegistrationAdminScreenState extends State<RegistrationAdminScreen> {
  bool _obscuretext = true;
  late String email;
  late String password;
  late String name;
  final _auth = FirebaseAuth.instance;
  File _pickedImage = File('your initial file');
  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
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

  void _remove() {
    setState(() {
      _pickedImage = File('your initial file');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Add new admin",
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
                    padding: const EdgeInsets.only(right: 200, top: 26),
                    child: Text(
                      "Full Name",
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
                        prefixIcon: Icon(Icons.person),
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
                      "Email",
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
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
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
                    padding: const EdgeInsets.only(right: 200, top: 26),
                    child: Text(
                      "Password",
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
                      obscureText: _obscuretext,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                          child: Icon(_obscuretext
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
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
                    padding: const EdgeInsets.only(right: 165, top: 26),
                    child: Text(
                      "Profile picture",
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
                  Stack(children: [
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
                  ]),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 70),
                    child: MyButton3(
                        color: Color.fromRGBO(154, 153, 238, 1),
                        title: "ADD New Admin",
                        onPressed: () async {
                          try {
                            String _randomString =
                                math.Random().nextInt(9999).toString() +
                                    math.Random().nextInt(9999).toString() +
                                    math.Random().nextInt(9999).toString();
                            String profilimg;
                            final ref = FirebaseStorage.instance
                                .ref()
                                .child('ProfilImages')
                                .child('imagesProfilesadm' +
                                    _randomString +
                                    '.jpg');
                            await ref.putFile(_pickedImage);
                            profilimg = await ref.getDownloadURL();
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            final User? user = _auth.currentUser;
                            final _uid = user?.uid;
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(_uid)
                                .set({
                              'id': _uid,
                              'email': email,
                              'profilemage': profilimg,
                              'fullname': name,
                              'type': 1,
                            });
                          } catch (e) {
                            print(e);
                          }
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
