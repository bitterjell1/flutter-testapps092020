import 'package:flutter/material.dart';
import 'package:flutter_test_apps092020/constant.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/registerPage";

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: ColorPallete.primaryColor,
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                _iconRegister(),
                _titleDescription(),
                _textField(),
                _buildButton(context),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _iconRegister() {
    return Image.asset(
      "assets/image/icon_register.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        "Registration",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      Text(
        "Lorem pisum dolor sit amet consectetur adipiscing elit",
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ]);
  }

  Widget _textField() {
    var underlineTextField;
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPallete.underlineTextField,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Username",
          hintStyle: TextStyle(color: ColorPallete.hintColor),
        ),
        style: TextStyle(color: Colors.white),
        autofocus: false,
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPallete.underlineTextField,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Password",
          hintStyle: TextStyle(color: ColorPallete.hintColor),
        ),
        style: TextStyle(color: Colors.white),
        obscureText: true,
        autofocus: false,
      )
    ]);
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              'Register',
              style: TextStyle(color: ColorPallete.primaryColor),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          'Or',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
        FlatButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        )
      ],
    );
  }
}
