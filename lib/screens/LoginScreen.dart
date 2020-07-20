import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/screens/main_screen.dart';
import 'package:flutter_sample/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {

  static const routName = "/LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isUserNameValid = true;
  bool isPasswordValid = true;

  validateAndLogin() {
    if (_userNameController.text.isEmpty) {
      setState(() {
        isUserNameValid = false;
      });
    } else if (_passwordController.text.isEmpty ||
        _passwordController.text.length < 6) {
      setState(() {
        isUserNameValid = true;
        isPasswordValid = false;
      });
    } else {
      _saveUserName();
    }
  }

  _saveUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_NAME, _userNameController.text);
    await prefs.setBool(LOGIN_STATUS, true);
    Navigator.of(context).pushReplacementNamed(MainScreen.routName);
  }

  bool validEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(top: 25, bottom: 25, left: 15, right: 15),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    child: Text(
                      "Flutter",
                      style: TextStyle(
                          fontSize: 32, color: Theme.of(context).primaryColor),
                    ),
                    padding: EdgeInsets.all(8.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Enter Username",
                          errorText: isUserNameValid ? null : "Enter Username"),
                      controller: _userNameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Enter Password",
                          errorText:
                              isPasswordValid ? null : "Invalid Password"),
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Login"),
                      onPressed: validateAndLogin,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
