import "package:flutter/material.dart";
import "Home/InfoTab.dart";
import 'Auth/AuthenticationPage.dart';
import 'Home/Homepage.dart';



void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'CosmoApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: AuthenticationPage(),
    );
  }
}
