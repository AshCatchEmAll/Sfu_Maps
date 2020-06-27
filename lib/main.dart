import 'package:Sfu_Interactive_Maps/Maps.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4e3e3),
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.map,
                color: Color(0xffff6b81),
              ),
              Text(
                "Interactive map",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff2f3542)),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xfff4e3e3),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              splashColor: Colors.tealAccent,
              color: Color(0xdfff6b81),
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: Text(
                "Burnbay Campus",
                style: TextStyle(color: Colors.red[50]),
              ),
              onPressed: () {
                //Display the burnbay map 
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Maps(
                              campusName: "Burnbay",
                            )));
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              splashColor: Colors.tealAccent,
              color: Color(0xdfff6b81),
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: Text(
                "Surrey Campus",
                style: TextStyle(color: Colors.red[50]),
              ),
              onPressed: () {
                //Display the surrey map 
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Maps(
                              campusName: "Surrey",
                            )));
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              splashColor: Colors.tealAccent,
              color: Color(0xdfff6b81),
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: Text(
                "Vancouver Campus",
                style: TextStyle(color: Colors.red[50]),
              ),
              onPressed: () {
                //Display the vancouver map 
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Maps(
                              campusName: "Vancouver",
                            )));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "With ❤ ",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        )
      ]),
    );
  }
}
