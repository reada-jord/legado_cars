import 'package:firebase_test/screens/AdminsInfo_screen.dart';
import 'package:firebase_test/screens/ClientsInfo_screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  static const String ScreenRoute = 'Home_screen';

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(152, 189, 255, 1),
        title: Text("JORD Reda"),
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Text(
                'CLIENTS',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Tab(
              child: Text(
                'ADMINS',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          ClientsInfo(),
          AdminsInfo(),
        ],
      ),
    );
  }
}
