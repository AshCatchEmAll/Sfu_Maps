

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String TABLE_MARKERS = "markers";
  static const String COLUMN_ID = "id";
  static const String COLUMN_LONGITUDE = "longitude";
  static const String COLUMN_LATITUDE = "latitude";
  static const String COLUMN_CAMPUS = "campus";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_SUBTITLE = "subtitle";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print("data base getter called");

    if (_database != null) return _database;

    _database = await createDatabase();

    return _database;
  }

  fromMap(Map<String, dynamic> map) {
    LatLng position = LatLng(map[DatabaseProvider.COLUMN_LATITUDE],
        map[DatabaseProvider.COLUMN_LATITUDE]);
    Marker mark = new Marker(
      markerId: map[DatabaseProvider.COLUMN_ID],
      infoWindow: InfoWindow(
        title: map[DatabaseProvider.COLUMN_TITLE] ?? null,
        snippet: map[DatabaseProvider.COLUMN_SUBTITLE] ?? null,
      ),
      position: position,
    );

    return mark;
  }

  Future<void> updateMarker({Marker marker,String campusName})async{
    print("updated");
    final db = await database;

    await db.update(
      TABLE_MARKERS,
      toMap(campusName: campusName,position: marker.position,subtitle: marker.infoWindow.snippet,title: marker.infoWindow.title),
      where: "id=?",
      whereArgs: [marker.markerId]
    );
  }

  getMarkers() async {
    List<Marker> list;
    final db = await database;
    var dbReturn = await db.query(
      DatabaseProvider.TABLE_MARKERS,
      columns: [
        DatabaseProvider.COLUMN_ID,
        DatabaseProvider.COLUMN_TITLE,
        DatabaseProvider.COLUMN_SUBTITLE,
        DatabaseProvider.COLUMN_LATITUDE,
        DatabaseProvider.COLUMN_LATITUDE,
        DatabaseProvider.COLUMN_CAMPUS,
      ],
    );
    dbReturn.forEach((element) {
      Marker marker = fromMap(element);
      list.add(marker);
    });
    return list;
  }
  Map<String,dynamic> toMap({LatLng position, String title, String subtitle, String campusName}){
    var map = new Map<String,dynamic>( );
   map[DatabaseProvider.COLUMN_CAMPUS] = campusName;
   map[DatabaseProvider.COLUMN_ID] = position.longitude;
   map[DatabaseProvider.COLUMN_LATITUDE] = position.longitude;
   map[DatabaseProvider.COLUMN_LONGITUDE] = position.latitude;
   if(title!=null){
      map[DatabaseProvider.COLUMN_TITLE] = title;
   }
   if(subtitle!=null){
     map[DatabaseProvider.COLUMN_SUBTITLE] = subtitle;
   } 
   
    return map;
  }

  Future insert ({Marker marker, String campusName})async{
    print("inserted");
    final db = await database;
    await db.insert(
      DatabaseProvider.TABLE_MARKERS,
        {
        "campusName": campusName,
        "position": marker.position,
        "subtitle": marker.infoWindow.snippet,
        "title": marker.infoWindow.title,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      
  }


  Future<Database> createDatabase() async {
    print("Created");
    String path = await getDatabasesPath();

    return await openDatabase(join(path, "markers.db"), version: 1,
        onCreate: (Database database, int version) async {
      print("Creating table");

      await database.execute(
        "CREATE TABLE $TABLE_MARKERS("
        "$COLUMN_ID FLOAT PRIMARY KEY ,"
        "$COLUMN_TITLE TEXT,"
        "$COLUMN_SUBTITLE TEXT,"
        "$COLUMN_LONGITUDE FLOAT,"
        "$COLUMN_LATITUDE FLOAT,"
        "$COLUMN_CAMPUS TEXT"
        ")",
      );
    });
  }

  Future<void> deleteMarker({Marker marker})async{
    final db = await database;
    await db.delete(
      TABLE_MARKERS,
      where:"id=?",
      whereArgs: [marker.markerId]
    );
  }


}
