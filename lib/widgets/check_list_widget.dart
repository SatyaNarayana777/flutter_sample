import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/providers/VanCheckListProvider.dart';
import 'package:flutter_sample/screens/ChilckListDetail.dart';
import 'package:flutter_sample/utils/HexColour.dart';
import 'package:provider/provider.dart';

class CheckListWidget extends StatefulWidget {
  @override
  _CheckListWidgetState createState() => _CheckListWidgetState();
}

class _CheckListWidgetState extends State<CheckListWidget> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CheckListItems>(context, listen: false).getVanCheckLists();
    return Consumer<CheckListItems>(builder: (ctx, checkListItems, child) {
      return checkListItems.items.length == 0
          ? Center(child: Text("No Data Found"))
          : ListView.builder(
              itemCount: checkListItems.items.length,
              itemBuilder: (ctx, position) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.all(8),
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                        color: HexColor(
                            checkListItems.items[position].colourcode)),
                    child: ListTile(
                      title: Text(
                        checkListItems.items[position].categoryname,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(
                            checkListItems.items[position].questions.length
                                .toString(),
                            style: TextStyle(
                                color: HexColor(checkListItems
                                    .items[position].colourcode),
                                fontSize: 18),
                          )),
                      onTap: () => {
                        Navigator.of(context).pushNamed(
                            CheckListDetail.routeName,
                            arguments: checkListItems.items[position])
                      },
                    ),
                  ),
                );
              });
    });
  }
}
