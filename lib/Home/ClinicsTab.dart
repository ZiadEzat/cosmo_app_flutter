import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ClinicsTab extends StatefulWidget {
  @override
  State<ClinicsTab> createState() => ClinicsTabState();
}

Completer<GoogleMapController> _controller = Completer();
PanelController _pc = new PanelController();

class ClinicsTabState extends State<ClinicsTab> {
  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  final MarkerId markerId = MarkerId("2");
  final MarkerId markerId2 = MarkerId("3");

  final Marker marker = Marker(
      markerId: MarkerId("3"),
      position: LatLng(37.42796133580664, -122.085749655962));

  final Marker marker2 = Marker(
      markerId: MarkerId("4"),
      position: LatLng(35.42796133580664, -121.085749655962));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      markers[markerId] = marker;
      markers[markerId2] = marker2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SlidingUpPanel(
          controller: _pc,
          renderPanelSheet: false,
          panel: _floatingPanel(),
          collapsed: _floatingCollapsed(),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set.of(markers.values),
          )),
    );
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
}

Widget _floatingCollapsed() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
    ),
    child: Center(
      child: Text(
        " Clinics",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    ),
  );
}

Widget _floatingPanel() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ]),
    child: Container(
      margin: const EdgeInsets.only(top: 36.0),
      child: StreamBuilder(
        stream: Firestore.instance.collection("offers").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return _buildItem(context, snapshot.data.documents[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: snapshot.data.documents.length);
        },
      ),
    ),
  );
}

Widget _buildItem(BuildContext context, DocumentSnapshot document) {
  return Column(
    children: <Widget>[
      InkWell(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(document["name"], style: TextStyle(fontSize: 22)),
                Text("DESCRIPTION", style: TextStyle(fontSize: 14))
              ],
            ),
          ),
          color: Colors.white,
        ),
        onTap: () {
          _pc.close();
          _goToTheLake();
        },
      )
    ],
  );
}

final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.42796133580664, -122.085749655962),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);

Future<void> _goToTheLake() async {
  final GoogleMapController controller = await _controller.future;

  controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
}
