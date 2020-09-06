import 'package:flutter/material.dart';
import 'package:flutter_test_apps092020/constant.dart';

class ListPeagawai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Pegawai"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Daniel"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Laura"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Annisa"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Rahmat"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Khairul"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Louise"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Sifara"),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("hyolee"),
          ),
        ],
      ),
    );
  }
}
