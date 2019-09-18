import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Map> items = [
  {"id": "1", "name": "Item 1", "price": "2000", "prevprice": "2500"},
  {"id": "3", "name": "Item 2", "price": "2000", "prevprice": "2500"},
  {"id": "4", "name": "Item 3", "price": "2000", "prevprice": "2500"},
  {"id": "5", "name": "Item 4", "price": "2000", "prevprice": "2500"},
  {"id": "6", "name": "Item 5", "price": "2000", "prevprice": "2500"},
  {"id": "7", "name": "Item 6", "price": "2000", "prevprice": "2500"},
  {"id": "2", "name": "Item 7", "price": "2000", "prevprice": "2500"},
];

class ItemsTab extends StatelessWidget {
  final Color primaryColor = Colors.blue;
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      home: Scaffold(
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
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return _buildItem(index);
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
              itemCount: items.length),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    Map item = items[index];
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
                          item["name"],
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
                              onPressed: () {},
                              color: Colors.blue,
                              child: Text(
                                "ADD TO CART",
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
