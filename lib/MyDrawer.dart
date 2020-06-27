import 'package:Sfu_Interactive_Maps/Facts.dart';
import 'package:Sfu_Interactive_Maps/Navigation.dart';
import 'package:Sfu_Interactive_Maps/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'ImportantContacts.dart';
import 'package:Sfu_Interactive_Maps/QrShare.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer(
      {this.campusName,
      this.markers,
      this.changeCamPosition,
      this.getSomePoints});
  List markers;
  String campusName;
  Function changeCamPosition;
  Function getSomePoints;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              child: Container(
                  //Insert burnbay image
                  )),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text("Important Contacts"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImportContacts(campusName: campusName)));
            },
          ),
          ListTile(
            leading: Icon(Icons.error_outline),
            title: Text("Fun Facts"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Facts()));
            },
          ),
          ListTile(
              leading: Icon(Icons.cached),
              title: Text("Choose other campus"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));

                Navigator.pop(context);
              }),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text("My Markers"),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  if (markers.length == 0) {
                    return Center(
                        child:
                            Text("No markers here,start by tapping the map"));
                  }
                  return Container(
                      child: ListView.builder(
                          itemCount: markers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(markers[index].infoWindow.title ??
                                  "MyUnNamedMarker\n(Click to zoom)"),
                              onTap: () {
                                changeCamPosition(
                                  CameraPosition(
                                      target: markers[index].position,
                                      zoom: 20),
                                );
                                Navigator.pop(context);
                              },
                              title: IconButton(icon: Icon(Icons.share),onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>QrShare(position: markers[index].position,)));
                              },),
                              trailing: IconButton(
                                icon: Icon(Icons.navigation),
                                tooltip: "Navigate between markers",
                                onPressed: () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return ListView.builder(
                                            itemCount: markers.length,
                                            itemBuilder: (context, ind) {
                                              return ListTile(
                                                title: Text(markers[ind]
                                                        .infoWindow
                                                        .title ??
                                                    "MyUnMarker\n(Click to show route)"),
                                                onTap: () {
                                                  print(
                                                      "${markers[index].position} ${markers[ind].position}");
                                                  getSomePoints(
                                                      origin: markers[index]
                                                          .position,
                                                      destination: markers[ind]
                                                          .position);
                                                  changeCamPosition(
                                                    CameraPosition(
                                                        target: markers[ind]
                                                            .position,
                                                        zoom: 16),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                              );
                                            });
                                      });
                                },
                              ),
                            );
                          }));
                },
              );
            },
          ),
         
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Recieve a marker"),
            onTap: () async{
             String barcodeScanRes = await scanQR();
             
             LatLng target = parseToLatLng(barcodeScanRes);
             
              if(barcodeScanRes!="-1")
              markers.add(Marker(
                markerId: MarkerId("${target.latitude}"),
                position: target,
                infoWindow: InfoWindow(
                  title: "This is shared Marker"
                ),
              
              ));
              changeCamPosition(
                CameraPosition(
                  target: target,
                  zoom: 16,
                ),

              );
              Navigator.pop(context);
            },
            
          
          ),
        ],
      ),
    );
  }
   LatLng parseToLatLng(String barcodeScanRes){
                 var target = barcodeScanRes.split(",");
               var latitude = target[0].split("(")[1];
              var longitude = target[1].split(")")[0];
              var lat = double.parse(latitude);
              var lon = double.parse(longitude);
              return LatLng(lat,lon);
              }
  Future scanQR() async{
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    "#ff6666", 
                                                    "Cancel", 
                                                    true, 
                                                    ScanMode.QR);
  return barcodeScanRes;
  }
}
