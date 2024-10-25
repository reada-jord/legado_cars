import 'package:firebase_test/screens/Addvoitureadmin_screen.dart';
import 'package:firebase_test/screens/CarAdmin_screen.dart';
import 'package:firebase_test/screens/Home_screen.dart';
import 'package:firebase_test/screens/InfosClient_screen.dart';
import 'package:firebase_test/screens/Login_screen.dart';
import 'package:firebase_test/screens/OrderClient_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/screens/launch_screen.dart';
import 'package:firebase_test/screens/logininterface_screen.dart';
import 'package:flutter/material.dart';

import 'CommandeAdmin_screen.dart';

class BottomBarClientScreen extends StatefulWidget {
  final id;
  final String email;
  final String fullname;
  final String phone;
  final String cin;
  final String im;
  final String im2;
  final String im3;
  final String im4;
  const BottomBarClientScreen({
    Key? key,
    required this.id,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.cin,
    required this.im,
    required this.im2,
    required this.im3,
    required this.im4,
  }) : super(key: key);
  static const String ScreenRoute = 'BottomBar_screen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarClientScreen> {
  List<Map<String, dynamic>>? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': InfosClientScreen(
          id: widget.id,
          email: widget.email,
          fullname: widget.fullname,
          phone: widget.phone,
          cin: widget.cin,
          im: widget.im,
          im2: widget.im2,
          im3: widget.im3,
          im4: widget.im4,
        ),
      },
      {
        'page': OrderClientScreen(
          id: widget.id,
        ),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages?[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Color.fromRGBO(249, 180, 1, 1),
              unselectedItemColor: Color.fromRGBO(255, 255, 255, 1),
              selectedItemColor: Color.fromRGBO(249, 120, 1, 1),
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.logout,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
