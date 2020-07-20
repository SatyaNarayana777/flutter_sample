import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample/models/van_check_list.dart';
import 'package:http/http.dart' as http;

class CheckListItems with ChangeNotifier{

  final List<VanCheckList> items = [];

  String url = 'https://run.mocky.io/v3/b0fdbada-4418-4b52-bf50-731bb90ec461';

  Future getVanCheckLists() async{

    print(url);

    final response = await http.get(url);

    final res = Response.fromJson(json.decode(response.body));

    items.clear();

    items.addAll(res.response);

    notifyListeners();
  }
}