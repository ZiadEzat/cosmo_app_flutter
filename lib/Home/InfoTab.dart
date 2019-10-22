import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ArticleRoute.dart';

final List<Map> articles = [
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
  {
    "title":
        "Lorem ipsum dolor sit ametconsectetur adipiscing elit. Nunc malesuada",
    "author": "Ziad Ezat",
    "time": "4 min read",
    "image": "assets/images/backimg.jpg"
  },
];

class InfoTab extends StatelessWidget {
  final Color primaryColor = Colors.blue;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  String name = "";
  String image = "";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Theme(
        data: ThemeData(
          primaryColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Theme.of(context).buttonColor,
          appBar: AppBar(
            centerTitle: true,
            title: Text('CosmoCare'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("All"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Medical"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Beauty"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Cosmetics"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("News"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ArticleRoute("Enlarged Pores", "https://www.laserclinics.com.au/globalassets/service-categories/skin/skin-treatments-landing-page/cosmedical-grade-peels-01.jpg")));
                      },
                      child: Container(
                        child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: <Widget>[
                              Container(
                                width: 500,
                                color: Colors.white,
                                child: Image.network(
                                  "https://laserandskin.ie/wp-content/uploads/2016/03/Affirm-Laser-1500x1000.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: Colors.black.withOpacity(0.6),
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Skin Concerns",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                90,
                                      ),
                                      Text(
                                        "Whatever it is that’s bothering you, we have a skin treatment to tackle it. ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text("Tab 2"),
              ),
              Container(
                child: Text("Tab 3"),
              ),
              Container(
                child: Text("Tab 4"),
              ),
              Container(
                child: Text("Tab 5"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleItem(BuildContext context, DocumentSnapshot document) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            color: secondaryColor,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 100,
                  color: Colors.blue,
                  width: 80.0,
                  child: Image.asset(
                    document["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        document["title"].toString(),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: primaryColor,
                                backgroundImage:
                                    AssetImage("assets/images/user.jpg"),
                              ),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0),
                            ),
                            TextSpan(
                                text: document["author"],
                                style: TextStyle(fontSize: 16.0)),
                            WidgetSpan(
                              child: const SizedBox(width: 20.0),
                            ),
                            WidgetSpan(
                              child: const SizedBox(width: 5.0),
                            ),
                            TextSpan(
                              text: document["time"],
                            ),
                          ],
                        ),
                        style: TextStyle(height: 2.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
