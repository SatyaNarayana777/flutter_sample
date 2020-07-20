import 'package:flutter/material.dart';
import 'package:flutter_sample/models/jobs_response.dart';
import 'package:flutter_sample/providers/JobsListProvider.dart';
import 'package:flutter_sample/screens/ItemsScreen.dart';
import 'package:provider/provider.dart';

class JobItemWidget extends StatelessWidget {
  final JobData jobData;

  JobItemWidget(this.jobData);

  static Widget customText(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              customText("FirstName : ${jobData.firstName}", context),
              customText("LastName : ${jobData.lastName}", context),
              customText("Mobile : ${jobData.mobile}", context),
              customText("No of people : ${jobData.noOfPeople}", context),
              customText("Duration : ${jobData.duration}", context),
            ],
          ),
        ),
        onTap: () => {
          jobData.isJobCompleted
              ? null
              : Navigator.of(context).pushNamed(ItemsScreen.routName).then(
                  (value) => value!=null&&value
                      ? Provider.of<JobsListProvider>(context, listen: false)
                          .markAsFavourate(jobData.jobId)
                      : null)
        },
      ),
    );
  }
}
