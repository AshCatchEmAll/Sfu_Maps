
///Displays the help Menu 
import 'package:flutter/material.dart';
class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
       
        elevation: 0,
        backgroundColor: Colors.red[50],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text("How to change view of the map?"),
              children: <Widget>[
                Text("Click the 'Change view' button at the bottom left to change between Normal view and satellite view",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("How to put a marker at a location on map?"),
              children: <Widget>[
                Text("Tap on the map to place marker at the desired place. You can tap on the marker to give it a name and also add short description such as 'food place'",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("Can I view main places on the campus?"),
              children: <Widget>[
                Text("Click the 'View places' button at the bottom right to view all the main areas on the campus. You can click on a specific place to zoom to that location",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("How can I navigate to the place I see in 'View places' tab"),
              children: <Widget>[
                Text("Click the 'Navigate' icon at the left of the place name to choose it as destination and then you can choose your starting point on the next prompt",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("Can I choose my current position as starting point for navigation?"),
              children: <Widget>[
                Text("Click the 'Navigate' icon at the left of the place name to choose it as destination and then you can choose your starting point on the next prompt",textAlign: TextAlign.center,)
              ],
            ),
             ExpansionTile(
              title: Text("Can I see the route between two of my markers on the map?"),
              children: <Widget>[
                Text("To let the app show you route between two markers on the map, simply open the side drawer by clicking on ☰ at the top left of the screen. Click on 'My Markers' and choose the two markers you desire to travel between",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("How can I zoom or tilt the map?"),
              children: <Widget>[
                Text("You can zoom in by pinching in or out and tilt the map by dragging your two fingers up and down on the map",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("I want to share a marker with my friend, is that possible?"),
              children: <Widget>[
                Text("Sharing is caring ! Please Navigate to the side menu by clicking on ☰ and click on 'My Markers'. Tap on the share icon to get a QR Code. Ask your friend to click on 'Recieve a marker' and scan this QR code to pinpoint the location on their device",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("Do i have to copy and paste the phone numbers manually?"),
              children: <Widget>[
                Text("Just tap on the number you wish to copy to your clipboard and it will be copied automatically !",textAlign: TextAlign.center,)
              ],
            ),
            ExpansionTile(
              title: Text("I dont like the app theme. Is there an option to change it?"),
              children: <Widget>[
                Text("Unfortunately, feature to change the theme is not implemented in this app yet. We hope the functionality makes up for it ",textAlign: TextAlign.center,)
              ],
            ),
             ExpansionTile(
              title: Text("Can I get turn to turn navigation?"),
              children: <Widget>[
                Text("Unfortunately, that feature is not yet available.",textAlign: TextAlign.center,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}