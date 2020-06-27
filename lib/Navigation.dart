import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:latlong/latlong.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
class Navigation extends StatelessWidget {
    // List burnbayRooms = [
    //   {"AQ":{"2013":LatLng(491644.4 ,1225502.4)}}
    //   {"AQ":{}}
    // ];

  final LatLng center = new LatLng(49.278094, -122.919883);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigation"),
      
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          FlutterMap(
            options: new MapOptions(
              center: center,
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
            
            ],
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(200)
                    ),
                  ),
                ),
                // ListView.builder(
                //   itemCount: \,
                //   itemBuilder: null
                //   ),
              ],
            ),
          ),
          RaisedButton(
            child: Text("Click"),
            onPressed: (){
              
            },
          ),
          
        ]),
      ),
    );
  }
}
