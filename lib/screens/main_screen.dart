import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample/screens/CheckListScreen.dart';
import 'package:flutter_sample/screens/JobsScreen.dart';
import 'package:flutter_sample/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  static const routName = "/MainScreen";

  _getCheckListStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get(CHECK_LIST_STATUS)!=null ? Navigator.of(context).pushReplacementNamed(JobsScreen.routeName): Navigator.of(context).pushReplacementNamed(CheckListScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return FutureBuilder(
        future: _getCheckListStatus(context),
        builder: (ctx, snapshot) {
          return Container();
        },
    );
  }
}
