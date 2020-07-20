class Response {
  bool _status;
  String _message;
  List<VanCheckList> _response;

  bool get status => _status;
  String get message => _message;
  List<VanCheckList> get response => _response;

  Response({bool status, String message, List<VanCheckList> response}) {
    _status = status;
    _message = message;
    _response = response;
  }

  Response.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["response"] != null) {
      _response = [];
      json["response"].forEach((v) {
        _response.add(VanCheckList.fromJson(v));
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

class VanCheckList {
  String _categoryname;
  String _colourcode;
  List<Questions> _questions;

  String get categoryname => _categoryname;
  String get colourcode => _colourcode;
  List<Questions> get questions => _questions;

  VanCheckList(
      {String categoryname, String colourcode, List<Questions> questions}) {
    _categoryname = categoryname;
    _colourcode = colourcode;
    _questions = questions;
  }

  VanCheckList.fromJson(dynamic json) {
    _categoryname = json["categoryname"];
    _colourcode = json["colourcode"];
    if (json["questions"] != null) {
      _questions = [];
      json["questions"].forEach((v) {
        _questions.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["categoryname"] = _categoryname;
    map["colourcode"] = _colourcode;
    if (_questions != null) {
      map["questions"] = _questions.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Questions {
  String _title;
  bool _marckcheckasfail;
  bool _mandatorytotakepic;
  bool _mandatorytoaddcomments;

  String get title => _title;
  bool get marckcheckasfail => _marckcheckasfail;
  bool get mandatorytotakepic => _mandatorytotakepic;
  bool get mandatorytoaddcomments => _mandatorytoaddcomments;

  Questions(
      {String title,
      bool marckcheckasfail,
      bool mandatorytotakepic,
      bool mandatorytoaddcomments}) {
    _title = title;
    _marckcheckasfail = marckcheckasfail;
    _mandatorytotakepic = mandatorytotakepic;
    _mandatorytoaddcomments = mandatorytoaddcomments;
  }

  Questions.fromJson(dynamic json) {
    _title = json["Title"];
    _marckcheckasfail = json["marckcheckasfail"];
    _mandatorytotakepic = json["mandatorytotakepic"];
    _mandatorytoaddcomments = json["mandatorytoaddcomments"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Title"] = _title;
    map["marckcheckasfail"] = _marckcheckasfail;
    map["mandatorytotakepic"] = _mandatorytotakepic;
    map["mandatorytoaddcomments"] = _mandatorytoaddcomments;
    return map;
  }
}
