import 'package:flutter/material.dart';
import 'package:flutter_test_apps092020/screens/login_view.dart';
import 'package:flutter_test_apps092020/screens/register_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "test app page",
    initialRoute: "/",
    routes: {
      "/": (context) => LoginPage(),
      RegisterPage.routeName: (context) => RegisterPage(),
    },
  ));
}
