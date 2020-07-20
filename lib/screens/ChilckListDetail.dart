import 'package:flutter/material.dart';
import 'package:flutter_sample/models/van_check_list.dart';
import 'package:flutter_sample/utils/HexColour.dart';

class CheckListDetail extends StatefulWidget {
  static const routeName = "/CheckListDetail";

  @override
  _CheckListDetailState createState() => _CheckListDetailState();
}

class _CheckListDetailState extends State<CheckListDetail> {
  @override
  Widget build(BuildContext context) {
    final checkItem = ModalRoute.of(context).settings.arguments as VanCheckList;
    return Scaffold(
      appBar: AppBar(
        title: Text(checkItem.categoryname),
      ),
      body: Container(
        child: ListView(
          children: checkItem.questions
              .map((question) => Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HexColor(checkItem.colourcode)),
                          child: Text(
                            (checkItem.questions.indexOf(question) + 1)
                                .toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          question.title,
                          style: TextStyle(
                              color: HexColor(checkItem.colourcode),
                              fontSize: 19),
                        ),
                      ),
                      Divider()
                    ],
                  )))
              .toList(),
        ),
      ),
    );
  }
}
