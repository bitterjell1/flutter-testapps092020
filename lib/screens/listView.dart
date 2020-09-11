import 'dart:html';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test_apps092020/constant.dart';

// class List_View extends StatelessWidget {

//   _List_ViewState createState() => _List_ViewState();

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text("ListView Pegawai"),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Daniel"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Laura"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Annisa"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Rahmat"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Khairul"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Louise"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Sifara"),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("hyolee"),
//             ),
//           ],
//         ),
//       );
//     }
class Testlistview {
  final int item_code;
  final String item_name;

  Testlistview({this.item_code, this.item_name});

  factory Testlistview.fromJson(Map<String, dynamic> json) {
    return Testlistview(
        item_code: json['item_code'], item_name: json['item_name']);
  }
}

class List_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Testlistview>>(
      future: _Fetchtestlistview(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Testlistview> data = snapshot.data;
          return _testListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  Future<List<Testlistview>> _Fetchtestlistview() async {
    final ListAPIUrl = 'http://172.104.44.22/api/resource/';
    final response = await http.get(ListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((testlistview) => new Testlistview.fromJson(testlistview))
          .toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}

ListView _testListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(data[index].position, data[index].company, Icons.work);
      });
}

ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.cyan[500],
      ),
    );
