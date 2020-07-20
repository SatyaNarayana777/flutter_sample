import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample/models/jobs_response.dart';
import 'package:http/http.dart' as http;

class JobsListProvider with ChangeNotifier{

  final List<JobData> jobsList  = [];

  String url = 'https://run.mocky.io/v3/df5ca02c-58e6-4d54-b6de-208f967b2876';

  Future getJobsList() async{

    final response = await http.get(url);

    print(url);

    final res = JobsResponse.fromJson(json.decode(response.body));

    jobsList.clear();

    jobsList.addAll(res.response);

    notifyListeners();
  }

  List<JobData> get completedJobs =>  jobsList.where((element) => element.isJobCompleted).toList();

  List<JobData> get pendingJobs =>  jobsList.where((element) => !element.isJobCompleted).toList();

  markAsFavourate(String jobId){
    jobsList.firstWhere((job) => job.jobId==jobId).changeJobStatus();
    notifyListeners();
  }
}