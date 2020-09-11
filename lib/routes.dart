import 'package:flutter/material.dart';
import 'package:flutter_test_apps092020/screens/login_view.dart';
import 'package:flutter_test_apps092020/screens/register_view.dart';

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
};
