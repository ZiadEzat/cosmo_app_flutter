import 'dart:ui';
import 'package:cosmo_app_flutter/Auth/RegisterationRoute.dart';
import 'package:flutter/cupertino.dart';

import 'package:cosmo_app_flutter/Auth/LoginRoute.dart';
import 'package:cosmo_app_flutter/Home/Homepage.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  final String backImg = "assets/images/backimg.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(backImg), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(48.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 48.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.local_hospital,
                      size: 64,
                      color: Colors.grey.shade800,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "CosmoApp",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Text("Slogan. Lorem. Ipsum. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 0,
                        highlightElevation: 0,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => RegisterationRoute()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "Already have account? "),
                      WidgetSpan(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginRoute()));
                        },
                        child: Text("Log in",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ))
                    ])),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
