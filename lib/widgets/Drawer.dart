import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/LoginScreen.dart';
import 'package:flutter_sample/screens/ProfileScreen.dart';
import 'package:flutter_sample/screens/main_screen.dart';
import 'package:flutter_sample/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatelessWidget {
  Future<String> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_NAME);
  }

  _clearData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushReplacementNamed(LoginScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              constraints: BoxConstraints.expand(),
              child: Center(
                  child: FutureBuilder<String>(
                      future: _getUserName(),
                      builder: (ctx, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : snapshot.hasData
                                  ? Text(
                                      "Hello ${snapshot.data}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    )
                                  : Text(""))),
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MainScreen.routName);
            },
          ),
          Divider(),ListTile(
            title: Text('My Profile'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProfileScreen.routName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            onTap: () {
              _clearData(context);
            },
          ),
          Divider()
        ],
      ),
    );
  }
}
