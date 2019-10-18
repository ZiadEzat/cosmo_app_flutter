import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _chatTabState();
  }
}

final Color primaryColor = Colors.blue;
final Color bgColor = Color(0xffF9E0E3);
final Color secondaryColor = Color(0xff324558);

class _chatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 1,
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
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, top: 16, bottom: 20),
                    child: Text(
                      "Top Consultants",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection("doctors")
                            .snapshots(),
                        builder: (context, snapshot) {
                          return ListView.separated(
                              padding: const EdgeInsets.all(16),
                              itemBuilder: (context, index) => _buildItem(
                                  context, snapshot.data.documents[index]),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 16.0),
                              itemCount: snapshot.data.documents.length);
                        }),
                  ),
                ],
              )),
        ));
  }
}

Widget _buildItem(BuildContext context, DocumentSnapshot document) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Stack(
        children: <Widget>[
          Container(
            height: 80,
            margin: const EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            document['image'])),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  height: 100,
                  width: 60,
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        document["name"],
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        document["role"],
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 80),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://upload.wikimedia.org/wikipedia/commons/d/dd/Star_rating_1_of_5.png")),


                      ),
                      height: 32,
                      width: 100,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.message, color: primaryColor),
                          ),
                          IconButton(
                            icon: Icon(Icons.info, color: primaryColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],
      ));
}
