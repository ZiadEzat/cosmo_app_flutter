import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ClinicList.dart';
import 'detailsTab.dart';

List<Map> items = [
  {"id": "1", "name": "Item 1", "price": "2000", "prevprice": "2500"},
  {"id": "3", "name": "Item 2", "price": "2000", "prevprice": "2500"},
  {"id": "4", "name": "Item 3", "price": "2000", "prevprice": "2500"},
  {"id": "5", "name": "Item 4", "price": "2000", "prevprice": "2500"},
  {"id": "6", "name": "Item 5", "price": "2000", "prevprice": "2500"},
  {"id": "7", "name": "Item 6", "price": "2000", "prevprice": "2500"},
  {"id": "2", "name": "Item 7", "price": "2000", "prevprice": "2500"},
];

class ItemsTab extends StatefulWidget {
  bool nextPage = false;
  ItemsTab(bool nextPage) {
    this.nextPage = nextPage;
  }
  @override
  State<StatefulWidget> createState() {
    return _ItemsTabState(nextPage);
  }
}

class _ItemsTabState extends State<ItemsTab> with TickerProviderStateMixin {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  bool button5 = false;
  bool button6 = false;
  bool button7 = false;
  bool button8 = false;
  bool nextPage = false;
  _ItemsTabState(bool nextPage) {
    this.nextPage = nextPage;
  }
  TabController _tabController;
  final Color primaryColor = Colors.blue;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 2 );
  }

  @override
  Widget build(BuildContext context) {
    if (nextPage == true){

    setState(() {

        _tabController.animateTo(1, duration: Duration(seconds: 1), curve: Curves.easeOut);

    });

    }
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
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
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              )
            ],
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              unselectedLabelColor: secondaryColor,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Cosmetic Products Offers"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Clinic Offers"),
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (button1 == true) {
                                button1 = false;
                              } else {
                                button1 = true;
                              }

                            });
                          },
                          child: CustomButton(button1, "Hair Removal"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button2 == true) {
                                button2 = false;
                              } else {
                                button2 = true;
                              }
                            });
                          },
                          child: CustomButton(button2, "Fractional Laser"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button3 == true) {
                                button3 = false;
                              } else {
                                button3 = true;
                              }
                            });
                          },
                          child: CustomButton(button3, "Skin Tightening"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button4 == true) {
                                button4 = false;
                              } else {
                                button4 = true;
                              }
                            });
                          },
                          child: CustomButton(button4, "Fat Reduction"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button5 == true) {
                                button5 = false;
                              } else {
                                button5 = true;
                              }
                            });
                          },
                          child: CustomButton(button5, "Cellulite Reduction"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button6 == true) {
                                button6 = false;
                              } else {
                                button6 = true;
                              }
                            });
                          },
                          child: CustomButton(button6, "Liposuction"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button7 == true) {
                                button7 = false;
                              } else {
                                button7 = true;
                              }
                            });
                          },
                          child: CustomButton(button7, "Facelift"),
                        ),InkWell(
                          onTap: () {
                            setState(() {
                              if (button8 == true) {
                                button8 = false;
                              } else {
                                button8 = true;
                              }
                            });
                          },
                          child: CustomButton(button8, "Cool Sculpting"),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder(
                        stream:
                            Firestore.instance.collection("offers").snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Loading...");
                          }
                          return ListView.separated(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              return _buildItem(
                                  context, snapshot.data.documents[index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16.0),
                          );
                        }),
                  ),
                ],
              ),
              Container(
                child: ClinicList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, DocumentSnapshot document) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          //elevation: 2,

          child: Container(
            color: Colors.transparent,
            height: 160,
            child: Row(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 120,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.shopify.com/s/files/1/0902/2442/products/IE_BrushTip_Black_open_640x.png?v=1566192579"),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(
                  width: 208,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          document["name"],
                          style: TextStyle(fontSize: 22),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "1,200.50 EGP",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "1500.00 EGP",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detailsTab()));
                              },
                              color: Colors.blue,
                              child: Text(
                                "SEE DETAILS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CustomButton(bool button1, String text) {
  return Container(
    margin: EdgeInsets.only(left: 10),
    width: 150.0,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 3),
      borderRadius: BorderRadius.circular(45),
      color: button1 ? Colors.blue : Colors.transparent,
    ),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: button1 ? Colors.white : Colors.black),
    )),
  );
}
