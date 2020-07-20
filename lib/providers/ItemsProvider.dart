import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample/models/items_response.dart';
import 'package:http/http.dart' as http;

class ItemsProvider with ChangeNotifier{

  String url = "https://run.mocky.io/v3/c5af2452-ab60-4fbe-b196-2d67766e3e4c";

  Future<List<Items>> fetchItems() async{

    print(url);

    final jsonResponse  = await http.get(url);

    final response = ItemsResponse.fromJson(jsonDecode(jsonResponse.body));

    return response.response;
  }
}