import 'dart:ui';
import 'package:cosmo_app_flutter/Auth/RegisterationRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:cosmo_app_flutter/Auth/LoginRoute.dart';
import 'package:cosmo_app_flutter/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthenticationPageState();
  }
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  var signedIn = false;
  final _googleSignIn = GoogleSignIn();
  final String backImg = "assets/images/backimg.jpg";

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => Homepage()));
    }, onError: (err) {
      print("HUGE EXCEPTION :" + err);
    });
    _googleSignIn.signInSilently();
  }

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
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _googleSignIn.signIn();
                        },
                      ),
                    ),
                    /*const SizedBox(height: 30.0),
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
                    ])),*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
