import 'package:flutter/material.dart';
import 'package:gp1/widget/app_drawer.dart';
import 'package:gp1/widget/course_gradil_filter.dart';
import 'package:gp1/widget/course_gride.dart';

class FilterScreen extends StatelessWidget {
  static const routename = '/filter_screen';
  @override
  Widget build(BuildContext context) {
    final coursedata = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(coursedata),
      ),
      drawer: AppDrawer(),
      body: CourseGride(
        courseList: coursedata,
        showpath: false,
      ),
    );
  }
}
