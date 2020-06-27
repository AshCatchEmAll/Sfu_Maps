
import 'package:Sfu_Interactive_Maps/DatabaseProvider.dart';

import 'package:Sfu_Interactive_Maps/Key.dart';

import 'package:Sfu_Interactive_Maps/MyDrawer.dart';
import 'package:Sfu_Interactive_Maps/Help.dart';
import 'package:flutter/material.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class Maps extends StatefulWidget {
  Maps({Key key, this.campusName,
  }) : super(key: key);

  final String campusName;
 

  @override
  _Maps createState() => _Maps();
}

class _Maps extends State<Maps> {
  //Controller for google maps
  Completer<GoogleMapController> _controller = Completer();

  //Maptype
  MapType _mapType;

  //The initial camera position which is the SFU Lat Long
  LatLng _center;

  //Set of markers to show on the map,
  List<Marker> markers = [];

 //This will iniitialize our markers List to disply on map 
  void getDatabase() async {
    final Database db = await DatabaseProvider.db.database;
    final List<Map<String, dynamic>> markerDB =
        await db.query(DatabaseProvider.TABLE_MARKERS);
    markers = List.generate(markerDB.length, (index) {
      if (markerDB[index]["latitude"] != null)
        return Marker(
          markerId: MarkerId(markerDB[index]['latitude'].toString()),
          position:
              LatLng(markerDB[index]['latitude'], markerDB[index]['longitude']),
          infoWindow: InfoWindow(
              title: markerDB[index]['title'],
              snippet: markerDB[index]['subtitle']),

              onTap: (){
                onMarkerTapped(context, LatLng(markerDB[index]['latitude'], markerDB[index]['longitude']));
              }
        );
      else
        return Marker(markerId: MarkerId("skip"));
    });
    setState(() {});
  }
 //Init state to load all the markers before the map loads,
  //This particular method will run before any UI is build on the device
  void initState() {
    getDatabase();
    _mapType = MapType.normal;
    print(widget.campusName);
    if (widget.campusName == "Burnbay") {
      places = burnbayPlaces;
      _center = const LatLng(49.278094, -122.919883);
    }
    if (widget.campusName == "Surrey") {
      places = surreyPlaces;
      _center = const LatLng(49.186740463405116, -122.84911371767522);
    }

    if (widget.campusName == "Vancouver") {
      places = vancouverPlaces;
      _center = const LatLng(49.284621387800954, -123.1114924326539);
    }

    super.initState();
  }

  //

  //Change camera position after clicking on any place in "View places" lists
  void changeCamPosition(CameraPosition position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
    setState(() {});
  }
  //Controller for the map 
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  //Latlng for main places to view when user clicks on "View Places" button
  //It is a List of maps, since list gives us capabiities to work with indexes more conviniently
  List places = [];
  //Places for bunbay
  List burnbayPlaces = [
    //A
    {
      "Applied Science Building": LatLng(
        49.277788,
        -122.914097,
      )
    },
    {"A&W at cornerstone": LatLng(49.278197495158025, -122.9104682430625)},
    {"Academic quadrangle": LatLng(49.27839063313583, -122.91663229465483)},
    {
      "Autism and development disorder Lab":
          LatLng(49.27876531428131, -122.91707519441843)
    },
    //B
    {"Beedie field": LatLng(49.27897397960466, -122.92640123516321)},
    {
      "Bc liquor store at cornerstone":
          LatLng(49.27793786227924, -122.91100904345511)
    },
    {"Barbara Rae house": LatLng(49.28024760635323, -122.92661681771278)},
    //C
    {"Club llia": LatLng(49.27799932562003, -122.91232332587242)},
    {
      "Charging point for cars at cornerstone":
          LatLng(49.27773881677097, -122.91227001696825)
    },
    {"Cornerstone": LatLng(49.277897178317616, -122.9114740714431)},
    {"Cowichan Residence": LatLng(49.2806548625085, -122.9286888241768)},
    {"Cilcotlin Residence": LatLng(49.28034581182407, -122.92900297790766)},
    {"Campus Security": LatLng(49.27918242531977, -122.92038772255181)},
    //D
    {"Dining hall": LatLng(49.27989130913909, -122.9248046502471)},
    {"Department of economics": LatLng(49.28020823662182, -122.92227935045959)},

    //E
    {"East Parking lot": LatLng(49.27713817567557, -122.91007697582246)},
    //H
    {"Hamilton House": LatLng(49.28002801033899, -122.92763538658619)},
    //I
    {"Interfaith Centre": LatLng(49.279049002665495, -122.91562680155037)},
    {"Images Theatre": LatLng(49.279636, -122.916925)},
    //
    {"Kelowna Residence": LatLng(49.28034581182407, -122.92900297790766)},
    {"Kimberley Residence": LatLng(49.280362434557, -122.9295541718602)},
    {"Kitimat Residence": LatLng(49.28001926147354, -122.92952969670296)},

    //M
    {"Miniso": LatLng(49.278065819681814, -122.91176777333023)},
    {"Museum of archeology": LatLng(49.27952122974928, -122.91516914963724)},
    {'McTaggart Cowan hall': LatLng(49.27935215591239, -122.9254638031125)},
    {
      "Maggie Benston Food Court": LatLng(49.27864195197679, -122.9188045486808)
    },
    //N
    {"Nesters Market": LatLng(49.277807279767174, -122.9098781570792)},
    //p
    {"Pizza hutat cornerstone": LatLng(49.27792211365291, -122.91194010525942)},

    {"Pauline Jewett House": LatLng(49.280423019996796, -122.92761862277985)},
    {"Penriction Residence": LatLng(49.27989065297242, -122.93001651763916)},
    //Q

    {"Qualicum Residence": LatLng(49.28000416967699, -122.93055463582277)},
    {"Quesnel Residence": LatLng(49.27982372392587, -122.93102268129586)},
//R
    {
      "Renaissance at Science Building": LatLng(
        49.277907,
        -122.914296,
      )
    },
    {"Renaissance coffee": LatLng(49.279410555349784, -122.91562378406523)},
    //S

    {'Sfu library': LatLng(49.28004900760972, -122.91876699775459)},
    {
      "Sfu transportation centre":
          LatLng(49.280062787063756, -122.92028311640026)
    },
    {
      "Sfu statistics actuarial science":
          LatLng(49.2779603915554, -122.91478894650936)
    },
    {"SFU observatory": LatLng(49.27851005895884, -122.914951890707)},
    {"Steve's Poke bar": LatLng(49.27782784052068, -122.9118475690484)},
    {"SFU bookstore": LatLng(49.278979666487906, -122.91923839598893)},
    {"Starbucks": LatLng(49.27966296260966, -122.9210602864623)},
    {"SFu west gym": LatLng(49.27958247239325, -122.9231071472168)},
    {
      "Shurm Science K": LatLng(
        49.277788,
        -122.915689,
      )
    },
    {
      "Shurm Science P": LatLng(
        49.277668,
        -122.915793,
      )
    },
    {
      "Shurm Science B": LatLng(
        49.277389,
        -122.916828,
      )
    },
    {"South Science building": LatLng(49.27740196869621, -122.9179811105132)},
    {
      "Shurm Science C": LatLng(
        49.27806,
        -122.918062,
      )
    },
    {"Shadbolt House": LatLng(49.28014568242836, -122.92567167431118)},
    {"Squamish Residence": LatLng(49.2795188237867, -122.93096367269754)},
    {
      "SFU residance hall association":
          LatLng(49.2795354467984, -122.92396645992994)
    },
    {"Sfu art gallery": LatLng(49.27832545188698, -122.91725289076568)},
    {"Subway at cornerstone": LatLng(49.278087692708866, -122.9120386764407)},
    {
      "Starbucks at cornerstone": LatLng(49.27814631237349, -122.91226599365473)
    },
    {"Scotiabank": LatLng(49.277982045898504, -122.91135203093289)},
    {
      "Sfu conference and guest accommodation":
          LatLng(49.28001532448357, -122.92513355612755)
    },

    //T

    {
      "Tim Hortons at cornerstone":
          LatLng(49.27804963363556, -122.9095646739006)
    },
    {"Tim Hortons": LatLng(49.27993658461846, -122.92223107069731)},
    {"The Cornerstone": LatLng(49.277897178317616, -122.9114740714431)},
    {"Townhouses": LatLng(49.27984297150412, -122.92903784662485)},
    {"Tennis court": LatLng(49.277864806109086, -122.92313933372496)},
    {"TASC 2": LatLng(49.27708611685306, -122.91597783565521)},
    {"TASC 1": LatLng(49.276753639043505, -122.91407883167267)},

    //U

    {"Uncle Fatih's Pizza": LatLng(49.278123126992064, -122.90999148041008)},
    {"University town square": LatLng(49.27811787747025, -122.91267368942499)},
    //W
    {
      "West Mall": LatLng(
        49.28018,
        -122.921649,
      )
    },
//Z

    {"Zipcar at cornerstone": LatLng(49.278354542857706, -122.90938261896372)},

    {"Zipcar": LatLng(49.2800798473349, -122.92423099279404)},
  ];
  //Places for surrey 
  List surreyPlaces = [
    // A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    {"Central City plaza": LatLng(49.187847083078154, -122.84884080290793)},
    {"Charging point": LatLng(49.18532154355318, -122.8466708958149)},
    {"Charging point 2": LatLng(49.189144754856144, -122.85059899091719)},
    {"Dollarama": LatLng(49.18810675163402, -122.84210845828056)},
    {"Holland Park": LatLng(49.18403231823714, -122.84923911094666)},
    {
      "International clothiers": LatLng(49.185478448506075, -122.84812096506357)
    },
    {"Infinity tower": LatLng(49.18396175283588, -122.84481279551984)},
    {"King George station": LatLng(49.18276782358766, -122.84477323293687)},
    {"McDonald's": LatLng(49.18880138571303, -122.84482318907976)},
    {"McQuarrie": LatLng(49.18779777876804, -122.84942083060743)},

    {"McElhanney": LatLng(49.18814729048384, -122.8499663248658)},
    {"PwC": LatLng(49.1882003196319, -122.84978628158568)},
    {"Parking Lot #817": LatLng(49.18845450814749, -122.84866243600844)},
    {"Parking (Safeway Lot)": LatLng(49.19048577807518, -122.84732803702356)},
    {
      "Parking Surrey central lot #1618":
          LatLng(49.18969826002144, -122.84711983054875)
    },
    {"RBC bank": LatLng(49.18815233044664, -122.84593295305966)},

    {"Scotiabank": LatLng(49.18804912067133, -122.84685797989368)},
    {"Surey central station": LatLng(49.18958475471634, -122.84788694232701)},
    {"SCDC": LatLng(49.1878663665283, -122.85005182027818)},
    {"Surrey Libraries": LatLng(49.19043121754576, -122.84955829381944)},

    {"Starbucks": LatLng(49.18306017236264, -122.84469377249481)},
  ];
  //Places for vancouver
  List vancouverPlaces = [
    {"Alexander College": LatLng(49.28473161310488, -123.11324827373029)},
    {"BC liquor store": LatLng(49.28497349554704, -123.11158161610365)},
    {"Church of Scientology": LatLng(49.28366171740259, -123.11096537858248)},
    {"Delta hotels": LatLng(49.284065008696636, -123.11286170035599)},
    {"Dollarama": LatLng(49.28475020266557, -123.11126109212637)},
    {"Dressew supply": LatLng(49.28323392758763, -123.11036255210638)},
    {"Geos language plus": LatLng(49.28449454091614, -123.11160508543253)},
    {"Gastown steam clock": LatLng(49.28452975189448, -123.10898389667271)},
    {"Red Room": LatLng(49.28410721849497, -123.11130233108997)},
    {"RBC royal bank": LatLng(49.28532778775989, -123.11340283602478)},
    {"SFU Harbour centre": LatLng(49.284589894811724, -123.1116496771574)},
    {"SFU teck gallery": LatLng(49.28485802197943, -123.11135731637478)},
    {"Tim hortans": LatLng(49.28503844930995, -123.11211571097373)},
    {"Vancouver Lookout": LatLng(49.28473598711979, -123.11197489500044)},
    {
      "VGC international College": LatLng(49.28379140959394, -123.1110418215394)
    },
    {"Waterfront Station": LatLng(49.28592723563861, -123.11164028942584)},
  ];
  //This is for console log purposes so that print will print even a bigger output for debug purposes
  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }


  
  final List<LatLng> polylineCoordinates = [];
  final PolylinePoints polylinePoints = PolylinePoints();
  final Set<Polyline> _polylines = {};
  List<LatLng> routeCoords;

  //TODO: Please add your key in the Keys file 
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: Keys.directionAPI);


  GeolocationStatus geolocationStatus;

  LatLng userPosition;

//Getting location of the user 
  Future getLocation() async {
    Location location = new Location();

    var permission = await location.serviceEnabled();
    var appPermission = await location.hasPermission();

    if (permission == false) {
      permission = await location.requestService();
    }
    print("After service location");
    if (appPermission != PermissionStatus.granted) {
      appPermission = await location.requestPermission();
    }
    if (permission == true && appPermission == PermissionStatus.granted) {
      var a = await location.getLocation();
      userPosition = LatLng(a.latitude, a.longitude);
    }
    print("userposition inside function: $userPosition");
  }

//Direction function to get the polypoints to show route on map 
  void getSomePoints({LatLng destination, LatLng origin}) async {
    print("originnn $origin");
    try {
      if (origin == null) return;
      print("Destination $destination");
      PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(
          Keys.directionAPI,
          PointLatLng(origin.latitude, origin.longitude),
          PointLatLng(destination.latitude, destination.longitude),
          travelMode: TravelMode.walking);
      if (result.points.isEmpty) return;
      if (result.points.isNotEmpty) {
        
        result.points.forEach((element) {
        
          polylineCoordinates.add(LatLng(element.latitude, element.longitude));
        });
      }

      setState(() {
        Polyline polyline = Polyline(
            polylineId: PolylineId("polyline"),
            color: Colors.red[200],
            points: polylineCoordinates,
            width: 5,
            onTap: () {
              _polylines.clear();
            });


        _polylines.clear();
        _polylines.add(polyline);
        if (userPosition != null)
          changeCamPosition(
            CameraPosition(target: userPosition, zoom: 16),
          );
      });
    } catch (e) {
      print("getsomepoints inside try and cacth $e");
      return;
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        getSomePoints: getSomePoints,
        campusName: widget.campusName,
        changeCamPosition: changeCamPosition,
        markers: markers,
      ),
      appBar: AppBar(
          backgroundColor: Colors.red[300],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
              },
            ),
          ],
          title: Text(widget.campusName + " Campus")),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.690,
            child: GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              indoorViewEnabled: true,
              // buildingsEnabled: true,
              mapToolbarEnabled: true,
              polylines: _polylines,
              mapType: _mapType,
              markers: Set.of(markers),
              onMapCreated: _onMapCreated,
              compassEnabled: true,

              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 16.0,
              ),
              onTap: (latlng) {
                print(latlng);

                markers.add(
                  Marker(
                    markerId: MarkerId(latlng.toString()),
                    icon: BitmapDescriptor.defaultMarker,
                    position: latlng,
                    onTap: () {
                      print("tapped");
                      
                      onMarkerTapped(context, latlng);

                     
                    },
                  ),
                );

                DatabaseProvider.db.database.then((value) => value.insert(
                      DatabaseProvider.TABLE_MARKERS,
                      {
                       
                        "title": null,
                        "subtitle": null,
                        "longitude": latlng.longitude,
                        "latitude": latlng.latitude,
                        "campus": widget.campusName,
                      },
                    ));

                setState(() {});
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.17,
              color: Colors.red[200],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      splashColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.041),
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.view_carousel, color: Colors.red[200]),
                          const Text(
                            "Change view",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      onPressed: () {
                        _mapType = (_mapType == MapType.normal)
                            ? MapType.hybrid
                            : MapType.normal;
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 5),
                    RaisedButton(
                      splashColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200)),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.041),
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.delete_forever, color: Colors.red[200]),
                          const Text(
                            "Delete markers",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      onPressed: () {
                        //Logic for deleting markers 
                        deleteMarkers(context);
                      },
                    ),
                    SizedBox(width: 5),
                    RaisedButton(
                     splashColor: Colors.tealAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.041),
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.local_play, color: Colors.red[200]),
                          Text(
                            "View places",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      onPressed: () async {
                        //Logic for viewing places and navigating between them
                        await viewPlaces(context);
                      },
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  viewPlaces(BuildContext context) async {
    showModalBottomSheet(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) {
          return Container(
            child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  var k;
                  places[index].keys.forEach((j) => k = j);
                  LatLng destination = places[index]["$k"];
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    child: ListTile(
                      subtitle: Text("Click to show location"),
                      title: Text("${places[index].keys}"),
                      onTap: () {
                        var k;
                        places[index].keys.forEach((j) => k = j);
                       
                        destination = places[index]["$k"];

                        changeCamPosition(
                          CameraPosition(target: destination, zoom: 20),
                        );
                        Navigator.pop(context);
                      },
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            splashColor: Colors.redAccent,
                            child: Icon(
                              Icons.navigation,
                              color: Colors.red[200],
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                              await viewPlacesStartingPoint(
                                  context, index, destination);
                            },
                          ),
                          Text(
                            "Click to navigate",
                            style: TextStyle(fontSize: 6),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }

  viewPlacesStartingPoint(
      BuildContext context, int index, LatLng destination) async {
    showModalBottomSheet(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Please choose your Starting point to navigate to \n${places[index].keys}",
                    textAlign: TextAlign.center,
                  ),
                ),
                RaisedButton(
                  splashColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                        "Click to choose current location as starting point"),
                    onPressed: () async {
                      
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(200)),
                                title:
                                    Center(child: CircularProgressIndicator()),
                              ));
                      if (userPosition == null) {
                        await getLocation();
                      }

                      print("calling getsomePoints");
                      getSomePoints(
                          destination: destination, origin: userPosition);

                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: ListView.builder(
                      itemCount: places.length,
                      itemBuilder: (context, index) {
                        var k;
                        places[index].keys.forEach((j) => k = j);
                        LatLng origin = places[index]["$k"];
                        return ListTile(
                          contentPadding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.1),
                          subtitle: Text("Click to select as Starting point"),
                          title: Text("${places[index].keys}"),
                          onTap: () async {
                            var k;
                            places[index].keys.forEach((j) => k = j);
                            
                            origin = places[index]["$k"];
                            getSomePoints(
                                destination: destination, origin: origin);
                            changeCamPosition(
                              CameraPosition(target: destination, zoom: 16),
                            );
                            Navigator.pop(context);
                          },
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }

  Future deleteMarkers(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          if (markers.length == 0)
            return Center(child: Text("No markers, Tap on map to add"));
          else
            return ListView.builder(
                itemCount: markers.length,
                itemBuilder: (context, index) {
                  String textTitle =
                      markers[index].infoWindow.title ?? "marker" + "$index";
                  var delete = markers[index].position.longitude;
                  return ListTile(
                    title: Text("$textTitle"),
                    trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          print(
                              "$index index ${markers[index].infoWindow.title}");
                          markers.removeAt(index);
                          DatabaseProvider.db.database.then((value) {
                            // print("index $index marker ${markers[index].markerId} ");
                            value.delete(
                              DatabaseProvider.TABLE_MARKERS,
                              where: "longitude=?",
                              whereArgs: [delete],
                            );
                          });
                          setState(() {});
                          Navigator.pop(context);
                        }),
                  );
                });
        });
  }

  Future onMarkerTapped(BuildContext context, LatLng latlng) {
    TextEditingController title = new TextEditingController();
    TextEditingController subtitle = new TextEditingController();
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xfff8edeb),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Enter Title"),
                  initialValue: title.text ?? "Enter title",
                  onChanged: (value) {
                    title.text = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration:
                      InputDecoration(hintText: "Enter Subtitle (optional)"),
                  initialValue: subtitle.text ?? "Enter subtitle",
                  onChanged: (value) {
                    subtitle.text = value;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    splashColor: Colors.tealAccent,
                    color: Color(0xffffa69e),
                    child: Text("Update marker",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                      markers
                          .removeWhere((element) => element.position == latlng);
                      places.add(
                        {'${title.text}': latlng},
                      );
                      printWrapped("$places");
                      markers.add(
                        Marker(
                            markerId: MarkerId(latlng.toString()),
                            infoWindow: InfoWindow(
                              title: title.text,
                              snippet: subtitle.text,
                            ),
                            position: latlng),
                      );
                      DatabaseProvider.db.database.then((value) => value.update(
                          DatabaseProvider.TABLE_MARKERS,
                          {
                            
                            "title": title.text,
                            "subtitle": subtitle.text,
                            "longitude": latlng.longitude,
                            "latitude": latlng.latitude,
                            "campus": widget.campusName,
                          },
                          where: "latitude=?",
                          whereArgs: [latlng.latitude]));

                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 5),
                  FlatButton(
                    padding: EdgeInsets.all(10),
                    child: Text("Delete"),
                    onPressed: () {
                      markers
                          .removeWhere((element) => element.position == latlng);

                      DatabaseProvider.db.database.then((value) {
                        value.delete(
                          DatabaseProvider.TABLE_MARKERS,
                          where: "latitude=?",
                          whereArgs: [latlng.latitude],
                        );
                      });
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        );
      },
    );
  }
}
