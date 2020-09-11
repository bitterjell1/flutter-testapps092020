import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_apps092020/data/json_user.dart';

class LoginWithRestfulApi extends StatefulWidget {
  @override
  _LoginWithRestfulApiState createState() => _LoginWithRestfulApiState();
}

class _LoginWithRestfulApiState extends State<LoginWithRestfulApi> {
  static var uri = "http://172.104.44.22/api/method/login";
  static BaseOptions options = BaseOptions(
      baseUrl: uri,
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
      });
  static Dio dio = Dio(options);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<dynamic> _loginUser(String email, String password) async {
    try {
      Response response = await dio
          .post('/users/login', data: {"email": email, "password": password});
      // Response response = await dio
      //     .post('/users/login', data: {"email": email, "password": password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else
        throw Exception('Authentication Error');
    } on DioError catch (exception) {
      if (exception == null ||
          exception.toString().contains('SocketException')) {
        throw Exception("Network Error");
      } else if (exception.type == DioErrorType.RECEIVE_TIMEOUT ||
          exception.type == DioErrorType.CONNECT_TIMEOUT) {
        throw Exception(
            "Could'nt connect, please ensure you have a stable network.");
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Login using RESTFUL api")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    color: Colors.red,
                    onPressed: () async {
                      setState(() => _isLoading = true);
                      var res = await _loginUser(
                          _emailController.text, _passwordController.text);
                      setState(() => _isLoading = false);
                      JsonUser user = JsonUser.fromJson(res);
                      if (user != null) {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new LoginScreen(
                            user: user,
                          );
                        }));
                      } else {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Wrong email or")));
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({@required this.user});
  final JsonUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Center(
        child: user != null
            ? Text("Logged IN \n \n Email: ${user.email} ")
            : Text("Yore not Logged IN"),
      ),
    );
  }
}
