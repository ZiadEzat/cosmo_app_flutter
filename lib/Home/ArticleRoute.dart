import 'dart:io';
import 'package:cosmo_app_flutter/Home/ItemsTab.dart';
import 'package:flutter/material.dart';

import 'ClinicsTab.dart';

class ArticleRoute extends StatefulWidget {
  String title = "";
  String image = "";

  ArticleRoute(String title, String image) {
    this.title = title;
    this.image = image;
  }
  @override
  _ArticleRouteState createState() => _ArticleRouteState(title, image);
}

class _ArticleRouteState extends State<ArticleRoute> {
  String title = "";
  String image = "";

  _ArticleRouteState(String title, String image) {
    this.title = title;
    this.image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          height: 250,
          child: Hero(
            tag: 'image',
            child: Material(
              child: Stack(
                children: <Widget>[
                  Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                  Container(color: Colors.black.withOpacity(0.5)),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                      ],
                    ),
                  )
                ],
                fit: StackFit.expand,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("It's when smaller is better",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  "A tailored treatment plan can help reduce the size of your pores. Usually it’s a combination of Fractional RF, Skin needling and Chemical peels.",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  "Fractional RF rejuvenates your skin to firm it, improve tone and reduce imperfections like pore size and acne scarring.",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  "Skin needling (Dermal rolling) stimulates your organic collagen renewal to reduce pore size and acne scarring (perfect if you can’t do laser therapy treatments).",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  "Chemical peels exfoliate deeply to improve tone and texture. We can recommend the one that’s perfect for your skin needs.",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: RaisedButton(
                        child: Text(
                          "Discover Offers",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsTab(true)));},
                      ),
                    ),
                    RaisedButton(child: Text("Find Clinic", style: TextStyle(color: Colors.white)), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsTab(false)));
                    }, color: Colors.blue),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
