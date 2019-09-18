import 'package:cosmo_app_flutter/Home/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterationRoute extends StatefulWidget {
  @override
  _RegisterationRouteState createState() {
    // TODO: implement createState
    return _RegisterationRouteState();
  }
}

class _RegisterationRouteState extends State<RegisterationRoute> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  int loginState = 0;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: TextField(
                        decoration: InputDecoration(labelText: "First name"),
                        controller: firstname,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: TextField(
                        decoration: InputDecoration(labelText: "Last name"),
                        controller: lastname,
                      ),
                    ),
                  )
                ],
              )),
              Container(
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
                      decoration: InputDecoration(labelText: "password"),
                      controller: password,
                    ),
                    TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(labelText: "Confirm Password"),
                      controller: confirmpassword,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          register();
                          if (loginState == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()));
                          }
                        },
                      ),
                    ),
                    Visibility(
                        visible: isVisible,
                        child: Text(
                          "One or more of the fields are invalid",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() async {
    try {
      AuthResult firebaseUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
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
