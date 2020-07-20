import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/models/items_response.dart';
import 'package:flutter_sample/providers/ItemsProvider.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatelessWidget {
  static const routName = "/Items";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => showDialog(context: context,child: AlertDialog(
              title: Text("Confirmation"),
              content: Text("Do you want to complete the Job?"),
              actions: <Widget>[
                FlatButton(child: Text("Yes",style: TextStyle(color: Theme.of(context).primaryColor),),onPressed: ()=>{
                  Navigator.of(context).pop(true)

                },),
                RaisedButton(child: Text("No",style: TextStyle(color: Colors.white),),color: Theme.of(context).primaryColor,onPressed: ()=>{
                  Navigator.of(context).pop(false)
                },)
              ],
            ),barrierDismissible: false).then((value) => Navigator.of(context).pop(value)),
          )
        ],
      ),
      body: FutureBuilder<List<Items>>(
        future: Provider.of<ItemsProvider>(context, listen: false).fetchItems(),
        builder: (ctx, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, pos) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(snapshot.data[pos].itemName),
                            subtitle: Text(snapshot.data[pos].shortDesc),
                            trailing: Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle),
                              child: Text(
                                snapshot.data[pos].itemQty,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      })
                  : Center(child: Text("No Data Found"));
        },
      ),
    );
  }
}
