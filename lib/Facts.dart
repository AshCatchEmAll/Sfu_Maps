import 'package:flutter/material.dart';
class Facts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fun Facts")),
      body: SingleChildScrollView(
              child: Column(
          children:[
            
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Simon Fraser University is consistently ranked among Canada’s top comprehensive universities.",textAlign: TextAlign.center,)),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("In a recent Forbes interview, Hollywood director Steward Hendler, whose upcoming film Halo was partly shot at SFU, described the campus as having “incredible, brutal concrete architecture. ",textAlign: TextAlign.center,)),
            ListTile(
              leading: Icon(Icons.star),
              title:Text("SFU’s best known athlete is Canadian hero Terry Fox, who was an SFU kinesiology student and junior varsity basketball team member in 1976.",textAlign: TextAlign.center,)),
            ListTile(
              leading: Icon(Icons.star),
              title:Text("By 1977, more than 10 per cent of players in the CFL were from SFU, ")),
            ListTile(
              leading: Icon(Icons.star),
              title:Text("TV series filmed on the mountain (SFU) include Fringe, Battlestar Galactica, Stargate SG-1, Millennium and, naturally, The X-Files.",textAlign: TextAlign.center,)),
            ListTile(
              leading: Icon(Icons.star),
              title:Text("SFU was the first Canadian university to appoint a female president.",textAlign: TextAlign.center,)),
            ListTile(
              leading: Icon(Icons.star),
              title:Text("SFU was nicknamed the “instant university” because construction started in November 1963 and it welcomed its first 2,628 students in September 1965.",textAlign: TextAlign.center,))
          ]
        ),
      ),
    );
  }
}