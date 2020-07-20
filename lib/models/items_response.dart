class ItemsResponse {
  bool _status;
  String _message;
  List<Items> _response;

  bool get status => _status;

  String get message => _message;

  List<Items> get response => _response;

  ItemsResponse({bool status, String message, List<Items> response}) {
    _status = status;
    _message = message;
    _response = response;
  }

  ItemsResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["response"] != null) {
      _response = [];
      json["response"].forEach((v) {
        _response.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_response != null) {
      map["response"] = _response.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Items {
  String _itemName;
  String _itemQty;
  String _shortDesc;
  String _longDesc;
  bool _isLater;

  String get itemName => _itemName;

  String get itemQty => _itemQty;

  String get shortDesc => _shortDesc;

  String get longDesc => _longDesc;

  bool get isLater => _isLater;

  Items(
      {String itemName,
      String itemQty,
      String shortDesc,
      String longDesc,
      bool isLater}) {
    _itemName = itemName;
    _itemQty = itemQty;
    _shortDesc = shortDesc;
    _longDesc = longDesc;
    _isLater = isLater;
  }

  Items.fromJson(dynamic json) {
    _itemName = json["itemName"];
    _itemQty = json["itemQty"];
    _shortDesc = json["shortDesc"];
    _longDesc = json["longDesc"];
    _isLater = json["isLater"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["itemName"] = _itemName;
    map["itemQty"] = _itemQty;
    map["shortDesc"] = _shortDesc;
    map["longDesc"] = _longDesc;
    map["isLater"] = _isLater;
    return map;
  }
}
