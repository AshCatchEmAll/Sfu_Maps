

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QrShare extends StatelessWidget {
  QrShare({this.position});
  final LatLng position;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
                data: "$position",
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: Colors.red[200],
               
              ),
              SizedBox(height:15),
            Text("Because sharing is caring ❤"),
          ],
        ), 
      
      ),
    );
  }
}