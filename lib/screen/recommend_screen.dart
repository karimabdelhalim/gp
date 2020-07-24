import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/widget/app_drawer.dart';
import 'package:gp1/widget/rigistered_Item.dart';
import 'package:provider/provider.dart';

class RecommendedCoursesScreen extends StatelessWidget {
  static const routename = '/recommend_course';
  @override
  Widget build(BuildContext context) {
    final rigesteredCourses = Provider.of<Courses>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('your Recommended Courses'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Column(
          children: <Widget>[
            Divider(),
            RegisteredItem(
              name: rigesteredCourses.items[i].name,
              package: rigesteredCourses.items[i].catrgory,
              id: rigesteredCourses.items[i].id,
            )
          ],
        ),
        itemCount: rigesteredCourses.items.length,
      ),
    );
  }
}
