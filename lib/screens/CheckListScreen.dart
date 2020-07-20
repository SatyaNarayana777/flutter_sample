import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/JobsScreen.dart';
import 'package:flutter_sample/utils/Constants.dart';
import 'package:flutter_sample/widgets/Drawer.dart';
import 'package:flutter_sample/widgets/check_list_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckListScreen extends StatelessWidget {

  static const routName = "/CheckListScreen";

  _saveCheckListStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(CHECK_LIST_STATUS, true);
    Navigator.of(context).pushReplacementNamed(JobsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckLists"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => {
              _saveCheckListStatus(context)
            },
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body:  CheckListWidget()
    );
  }
}
