import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmo_app_flutter/Auth/AuthenticationPage.dart';
import 'package:cosmo_app_flutter/Home/ChatTab.dart';
import 'package:cosmo_app_flutter/Home/InfoTab.dart';
import 'package:cosmo_app_flutter/Home/ItemsTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'ClinicsTab.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  var _googleSignIn = GoogleSignIn();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    InfoTab(),
    ItemsTab(),
    ChatTab(),
    ClinicsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Platform.isAndroid) {
          return SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "First Name Last Name",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              ListTile(
                title: Text("Sign out"),
                onTap: () {
                  _googleSignIn.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticationPage()));
                },
              ),
              ListTile(
                title: Text("add article"),
                onTap: () {
                  Firestore.instance.collection('articles').add({
                    "title":
                        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
                    "author": "Ziad Ezat",
                    "time": "4 min read",
                    "image": "assets/images/backimg.jpg"
                  });
                },
              ),
              ListTile(
                title: Text("add item"),
                onTap: () {
                  Firestore.instance.collection('offers').add({
                    "id": "1",
                    "name": "Item 1",
                    "price": "2000",
                    "prevprice": "2500"
                  });
                },
              )
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_incandescent),
              title: Text('article'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Offers'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              title: Text('Chat'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Clinics'),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
