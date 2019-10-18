import 'package:flutter/material.dart';

class detailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ListView(
            children: <Widget>[
              Image.network(
                  "https://cdn.shopify.com/s/files/1/0902/2442/products/IE_BrushTip_Black_open_640x.png?v=1566192579"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
      "Item 1",
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
      ),
    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text("1,200.50 EGP",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30.0,
                        )),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text("Description",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400))),
              Container(
                padding:
                    EdgeInsets.only(left: 20.0, right: 20.0, bottom: 100.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                brightness: Brightness.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  "Back to Shopping",
                  style: TextStyle(color: Colors.black),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.blue,
                      elevation: 0,
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:10.0, left: 13),
                              child: Icon(Icons.phone, color: Colors.white,),
                            ),
                            Text(
                              "Call",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      color: Colors.black54,
                      elevation: 0,
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:10.0),
                              child: Icon(Icons.location_on, color: Colors.white,),
                            ),
                            Text(
                              "Location",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildDropdownButton(List<String> items, String selectedValue) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      onChanged: (_) {},
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
