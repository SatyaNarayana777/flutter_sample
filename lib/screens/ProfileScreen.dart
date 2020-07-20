import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/Constants.dart';
import 'package:flutter_sample/widgets/Drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  static const routName = "/ProfileScreen";
  final TextEditingController _userNameController = TextEditingController();

  Future<String> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(USER_NAME) != null ? prefs.get(USER_NAME) : "";
  }

  _updateUserName(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER_NAME, _userNameController.text.trim());
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("User name updated"),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        drawer: NavigationDrawer(),
        body: FutureBuilder<String>(
          future: _getUserName(),
          builder: (ctx, snapshot) {
            _userNameController.value =
                _userNameController.value.copyWith(text: snapshot.data);
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, top: 25),
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(labelText: "UserName"),
                            controller: _userNameController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, top: 25),
                          child: RaisedButton(
                            child: Text("Update"),
                            onPressed: ()=>_updateUserName(context),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  );
          },
        ));
  }
}
