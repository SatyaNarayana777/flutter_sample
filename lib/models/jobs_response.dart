class JobsResponse {
  bool _status;
  String _message;
  List<JobData> _response;

  bool get status => _status;

  String get message => _message;

  List<JobData> get response => _response;

  JobsResponse({bool status, String message, List<JobData> response}) {
    _status = status;
    _message = message;
    _response = response;
  }

  JobsResponse.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    if (json["response"] != null) {
      _response = [];
      json["response"].forEach((v) {
        _response.add(JobData.fromJson(v));
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

class JobData {
  String _jobId;
  String _postCode;
  String _firstName;
  String _lastName;
  String _landLine;
  String _mobile;
  String _noOfPeople;
  String _duration;
  bool _isJobCompleted = false;
  List<Qust> _qust;

  String get jobId => _jobId;

  String get postCode => _postCode;

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get landLine => _landLine;

  String get mobile => _mobile;

  String get noOfPeople => _noOfPeople;

  String get duration => _duration;

  bool get isJobCompleted => _isJobCompleted;

  List<Qust> get qust => _qust;

  changeJobStatus() {
    _isJobCompleted = true;
  }

  JobData(
      {String jobId,
      String postCode,
      String firstName,
      String lastName,
      String landLine,
      String mobile,
      String noOfPeople,
      String duration,
      bool isJobCompleted = false,
      List<Qust> qust}) {
    _jobId = jobId;
    _postCode = postCode;
    _firstName = firstName;
    _lastName = lastName;
    _landLine = landLine;
    _mobile = mobile;
    _noOfPeople = noOfPeople;
    _duration = duration;
    _isJobCompleted = isJobCompleted;
    _qust = qust;
  }

  JobData.fromJson(dynamic json) {
    _jobId = json["jobId"];
    _postCode = json["postCode"];
    _firstName = json["firstName"];
    _lastName = json["lastName"];
    _landLine = json["landLine"];
    _mobile = json["mobile"];
    _noOfPeople = json["noOfPeople"];
    _duration = json["duration"];
    if (json["qust"] != null) {
      _qust = [];
      json["qust"].forEach((v) {
        _qust.add(Qust.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["jobId"] = _jobId;
    map["postCode"] = _postCode;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["landLine"] = _landLine;
    map["mobile"] = _mobile;
    map["noOfPeople"] = _noOfPeople;
    map["duration"] = _duration;
    if (_qust != null) {
      map["qust"] = _qust.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Qust {
  String _qust;
  String _ans;

  String get qust => _qust;

  String get ans => _ans;

  Qust({String qust, String ans}) {
    _qust = qust;
    _ans = ans;
  }

  Qust.fromJson(dynamic json) {
    _qust = json["qust"];
    _ans = json["ans"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["qust"] = _qust;
    map["ans"] = _ans;
    return map;
  }
}
