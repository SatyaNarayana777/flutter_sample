import 'package:flutter/material.dart';
import 'package:flutter_sample/models/jobs_response.dart';
import 'package:flutter_sample/providers/JobsListProvider.dart';
import 'package:flutter_sample/widgets/JobItemWidget.dart';
import 'package:provider/provider.dart';

class JobsWidget extends StatelessWidget {
  final position;

  JobsWidget(this.position);

  Widget _listWidget(List<JobData> jobsList){
    return ListView.builder(
        itemCount: jobsList.length,
        itemBuilder: (ctx, pos) =>
            JobItemWidget(jobsList[pos])
      //child: position==0? JobItemWidget("${jobsList.pendingJobs.length} Jobs"):Text("${jobsList.completedJobs.length} Jobs"),
    );

  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<JobsListProvider>(context,listen: false).getJobsList();
    return Consumer<JobsListProvider>(
      builder: (ctx, jobsList, child) {
        return position == 0
            ? jobsList.pendingJobs.length == 0
                ? Center(child: JobItemWidget.customText("No Pending Jobs Found",context))
                : _listWidget(jobsList.pendingJobs)
            : jobsList.completedJobs.length == 0
                ? Center(child: JobItemWidget.customText("No Completed Jobs Found",context))
                : _listWidget(jobsList.completedJobs);
      },
    );
  }
}
