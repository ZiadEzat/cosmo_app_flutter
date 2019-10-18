import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
            title: Text('CosmoApp'),
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
                  child: Text("Discover"),
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
              StreamBuilder(
                  stream: Firestore.instance.collection('articles').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('Loading...');
                    } else {
                      return ListView.separated(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return _buildArticleItem(
                              context, snapshot.data.documents[index]);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16.0),
                      );
                    }
                  }),
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
