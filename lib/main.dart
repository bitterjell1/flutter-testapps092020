import 'package:flutter/material.dart';
import 'package:flutter_test_apps092020/auth.dart';
import 'package:flutter_test_apps092020/data/json_restful_api.dart';
import 'package:flutter_test_apps092020/screens/listView.dart';
import 'package:flutter_test_apps092020/routes.dart';

void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      // routes: routes,
      home: LoginWithRestfulApi(),
    );
    child:
    Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Center(
        child: List_View(),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     title: "test app page",
//     initialRoute: "/",
//     routes: {
//       "/": (context) => LoginPage(),
//       RegisterPage.routeName: (context) => RegisterPage(),
//     },
//   ));
// }
