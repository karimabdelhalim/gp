import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/widget/app_drawer.dart';
import 'package:gp1/widget/course_gride.dart';
import 'package:gp1/widget/rigistered_Item.dart';
import 'package:provider/provider.dart';

class RegisteredCoursesScreen extends StatelessWidget {
  static const routename = '/registered_course';
  @override
  Widget build(BuildContext context) {
    final rigesteredCourses = Provider.of<Courses>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('your registered Courses'),
      ),
      drawer: AppDrawer(),
      body: CourseGride(
        showpath: false,
      ),
    );
  }
}
