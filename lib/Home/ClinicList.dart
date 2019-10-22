/**
 * Author: Sudip Thapa
 * profile: https://github.com/sudeepthapa
 */

import 'package:flutter/material.dart';

class ClinicList extends StatelessWidget {
  static final String path = "lib/src/pages/lists/list1.dart";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Lists(),
    );
  }
}

class Item {
  final String title;
  final String catagory;
  final String place;
  final String ratings;
  final String discount;
  final String image;

  Item(
      {this.title,
        this.catagory,
        this.place,
        this.ratings,
        this.discount,
        this.image});
}

class Lists extends StatelessWidget {
  final List<Item> _data = [
    Item(
        title: 'Medical Center',
        catagory: "Up to Six Sessions of Laser Hair Removal on a Choice of Area",
        place: "Dubai",
        ratings: "5.0/80",
        discount: "10 %",
        image: "https://images.pexels.com/photos/672142/pexels-photo-672142.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'King Medical',
        catagory: "Three or Six Sessions of Laser Hair Removal on Small, Medium or Large Area",
        place: "Dubai",
        ratings: "4.5/90",
        discount: null,
        image: "https://images.pexels.com/photos/1736222/pexels-photo-1736222.jpeg?cs=srgb&dl=adult-adventure-backpacker-1736222.jpg&fm=jpg"),
    Item(
        title: 'Al Biraa Clinic',
        catagory: "Three or Six Sessions of Laser Tattoo Removal on Small, Medium or Large Area",
        place: "Dubai",
        ratings: "4.5/90",
        discount: "12 %",
        image: "https://images.pexels.com/photos/62403/pexels-photo-62403.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'Noor Al Wasl Clinic',
        catagory: "One or Three Sessions of Laser Hair Removal on Choice of Areas",
        place: "Dubai",
        ratings: "4.5/90",
        discount: "15 %",
        image: "https://images.pexels.com/photos/189296/pexels-photo-189296.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    Item(
        title: 'Montreal International Clinics',
        catagory: "Up to Four Sessions of Laser Thread Vein Removal",
        place: "Dubai",
        ratings: "4.5/90",
        discount: "12 %",
        image: "https://images.pexels.com/photos/1319515/pexels-photo-1319515.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        Item item = _data[index];
        return Card(
          elevation: 3,
          child: Row(
            children: <Widget>[
              Container(
                height: 125,
                width: 110,
                padding:
                EdgeInsets.only(left: 0, top: 10, bottom: 70, right: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item.image),
                        fit: BoxFit.cover)),
                child:item.discount==null?Container(): Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        item.discount,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Discount",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                      Text(
                        item.catagory,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                      SizedBox(height: 10),
                      Text(
                        item.place,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),

                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.pink,
                            size: 18,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(item.ratings, style: TextStyle(
                              fontSize: 13
                          ),),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Ratings", style: TextStyle(fontSize: 13),),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}