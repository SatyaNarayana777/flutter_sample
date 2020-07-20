import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/screens/LoginScreen.dart';
import 'package:flutter_sample/screens/main_screen.dart';
import 'package:flutter_sample/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

_loginStatus(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final _loginStatus = prefs.getBool(LOGIN_STATUS);
  Timer(
      Duration(seconds: 3),
      () => _loginStatus != null
          ? Navigator.of(context).pushReplacementNamed(MainScreen.routName)
          : Navigator.of(context).pushReplacementNamed(LoginScreen.routName));
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return FutureBuilder(
        future: _loginStatus(context),
        builder: (ctx, snapshot) {
          return Scaffold(
              body: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image(image:AssetImage("images/flutter.png")),
                      SizedBox(height: 25,),
                      Text(
                        "Flutter Demo",
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
