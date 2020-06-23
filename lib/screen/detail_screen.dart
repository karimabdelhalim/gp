import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:provider/provider.dart';

class CourseDetailScreen extends StatelessWidget {
  static const routename = '/course-detail';
  @override
  Widget build(BuildContext context) {
    final courseID = ModalRoute.of(context).settings.arguments as String;
    final loadcoursedata =
        Provider.of<Courses>(context, listen: false).findbyid(courseID);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadcoursedata.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage('images/CourseFiel.png'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
