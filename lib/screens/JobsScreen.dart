import 'package:flutter/material.dart';
import 'package:flutter_sample/providers/JobsListProvider.dart';
import 'package:flutter_sample/widgets/Drawer.dart';
import 'package:flutter_sample/widgets/JobsWidget.dart';
import 'package:provider/provider.dart';

class JobsScreen extends StatefulWidget {
  static const routeName = "/JobsScreen";

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  var bottomPosition = 0;
  var isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<JobsListProvider>(context, listen: false).getJobsList();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Text("Pending"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel), title: Text("Completed"))
        ],
        currentIndex: bottomPosition,
        //selectedItemColor: Theme.of(context).primaryColor,
        onTap: (pos) => {changeBottomBarPosition(pos)},
        selectedItemColor: Theme.of(context).primaryColor,
        elevation: 4,
      ),
      body: JobsWidget(bottomPosition),
    );
  }

  changeBottomBarPosition(int pos) {
    setState(() {
      bottomPosition = pos;
    });
  }
}
