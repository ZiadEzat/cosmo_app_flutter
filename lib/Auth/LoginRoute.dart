import 'package:cosmo_app_flutter/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() {
    // TODO: implement createState
    return _LoginRouteState();
  }
}

class _LoginRouteState extends State<LoginRoute> {
  final username = TextEditingController();
  final password = TextEditingController();
  int loginState = 0;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
                controller: username,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                controller: password,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    login();
                    if (loginState == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    }
                  },
                ),
              ),
              Visibility(
                  visible: isVisible,
                  child: Text(
                    "Invalid username or password",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      AuthResult firebaseUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: username.text, password: password.text);
      loginState = 1;
    } catch (e) {
      setVisible(true);

      print(e);
    }
  }

  void setVisible(state) {
    setState(() {
      isVisible = state;
    });
  }
}
