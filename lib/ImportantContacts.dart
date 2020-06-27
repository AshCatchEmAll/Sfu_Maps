import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImportContacts extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ImportContacts({this.campusName});
  final String campusName;

  Container container;

  @override
  Widget build(BuildContext context) {
    if (campusName == "Burnbay")
      container = Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.only(top: 5),
          child: DataTable(dividerThickness: 2, columns: [
            DataColumn(
              label: Text("Burnbay Mountain Campus"),
            ),
            DataColumn(
                label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Telephone"), Text("(Click to copy)")],
            )),
          ], rows: [
            DataRow(cells: [
              DataCell(
                Text("Campus Security"),
              ),
              DataCell(
                Text("778.782.3100"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.3100"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Parking")),
              DataCell(
                Text("778.782.4577"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.4577"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Security (24 hours)")),
              DataCell(
                Text("778.782.3100"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.3100"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Winter Road Conditions")),
              DataCell(
                Text("604.444.4929"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "604.444.4929"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("SFU Bookstore")),
              DataCell(
                Text("778.782.3656"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.3656"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Simon Fraser Student Society")),
              DataCell(
                Text("778.782.3870"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.3870"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Academic Advising")),
              DataCell(
                Text("778.782.4356"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.4356"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Admissions")),
              DataCell(
                Text("778.782.3397"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.3397"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Campus Tours")),
              DataCell(
                Text("778.782.5620"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5620"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Student Information System Help")),
              DataCell(
                Text("778.782.6930"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.6930"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Financial Aid and Awards")),
              DataCell(
                Text("778.782.4139"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.4139"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("U-Pass Office")),
              DataCell(
                Text("778.782.6805"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.6805"));
                },
              ),
            ]),
          ]));
    if (campusName == "Surrey")
      container = Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.only(top: 5),
          child: DataTable(dividerThickness: 2, columns: [
            DataColumn(
              label: Text("Surrey Campus"),
            ),
            DataColumn(
                label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Telephone"), Text("(Click to copy)")],
            )),
          ], rows: [
            DataRow(cells: [
              DataCell(
                Text("External Relations"),
              ),
              DataCell(
                Text("778.782.408"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.408"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Library")),
              DataCell(
                Text("778.782.7411"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.7411"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Security")),
              DataCell(
                Text("778.782.7511"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.7488"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Student and Registrar Services")),
              DataCell(
                Text("778.782.7537"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.7537"));
                },
              ),
            ]),
          ]));
    if (campusName == "Vancouver")
      container = container = Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.only(top: 5),
          child: DataTable(dividerThickness: 2, columns: [
            DataColumn(
              label: Text("Vancouver Campus"),
            ),
            DataColumn(
                label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Telephone"), Text("(Click to copy)")],
            )),
          ], rows: [
            DataRow(cells: [
              DataCell(
                Text("Administration"),
              ),
              DataCell(
                Text("778.782.5010"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5010"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Health and Counselling Centre")),
              DataCell(
                Text("778.782.5200"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5200"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Library, Belzberg")),
              DataCell(
                Text("778.782.5050"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5050"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Meeting and Event Services")),
              DataCell(
                Text("778.782.5800"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5800"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Security")),
              DataCell(
                Text("778.782.5029"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5029"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Segal Graduate School of Business")),
              DataCell(
                Text("778.782.5800"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5800"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("SFU Bookstore")),
              DataCell(
                Text(" 778.782.5048"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: " 778.782.5048"));
                },
              ),
            ]),
            DataRow(cells: [
              DataCell(Text("Student and Registrar Services")),
              DataCell(
                Text("778.782.5000"),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: "778.782.5000"));
                },
              ),
            ]),
          ]));

    return Scaffold(
      appBar: AppBar(title: Text("Important Contacts")),
      body: SingleChildScrollView(
        child: container,
      ),
    );
  }
}
