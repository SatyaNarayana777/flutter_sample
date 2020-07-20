import 'package:flutter/material.dart';
import 'package:flutter_sample/providers/ItemsProvider.dart';
import 'package:flutter_sample/providers/JobsListProvider.dart';
import 'package:flutter_sample/providers/VanCheckListProvider.dart';
import 'package:flutter_sample/screens/CheckListScreen.dart';
import 'package:flutter_sample/screens/ChilckListDetail.dart';
import 'package:flutter_sample/screens/ItemsScreen.dart';
import 'package:flutter_sample/screens/JobsScreen.dart';
import 'package:flutter_sample/screens/LoginScreen.dart';
import 'package:flutter_sample/screens/ProfileScreen.dart';
import 'package:flutter_sample/screens/SplashScreen.dart';
import 'package:flutter_sample/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => CheckListItems(),
          ),
          ChangeNotifierProvider(create: (_) => JobsListProvider()),
          ChangeNotifierProvider(create: (_) => ItemsProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter",
          theme:
              ThemeData(primarySwatch: Colors.blue, accentColor: Colors.yellow),
          home: SplashScreen(),
          routes: {
            LoginScreen.routName: (ctx) => LoginScreen(),
            MainScreen.routName: (ctx) => MainScreen(),
            CheckListScreen.routName: (ctx) => CheckListScreen(),
            CheckListDetail.routeName: (ctx) => CheckListDetail(),
            JobsScreen.routeName: (ctx) => JobsScreen(),
            ItemsScreen.routName: (ctx) => ItemsScreen(),
            ProfileScreen.routName: (ctx) => ProfileScreen(),
          },
        ));
  }
}
