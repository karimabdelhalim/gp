import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/widget/app_drawer.dart';
import 'package:gp1/widget/badge.dart';
import 'package:gp1/widget/course_gride.dart';
import 'package:provider/provider.dart';

enum filteroption {
  pathed,
  all,
}

class CourseOverviewScreen extends StatefulWidget {
  @override
  _CourseOverviewScreenState createState() => _CourseOverviewScreenState();
}

class _CourseOverviewScreenState extends State<CourseOverviewScreen> {
  var _showpathedOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (filteroption selectValue) {
                setState(() {
                  if (selectValue == filteroption.pathed) {
                    _showpathedOnly = true;
                  } else {
                    _showpathedOnly = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('show only pathed'),
                      value: filteroption.pathed,
                    ),
                    PopupMenuItem(
                      child: Text('show all'),
                      value: filteroption.all,
                    )
                  ]),
//            Consumer<Courses>(
//              builder: (_, courses, ch) => Badge(
//                child: ch,
//                value: courses.coursecount.toString(),
//              ),
//              child: IconButton(
//                icon: Icon(Icons.shopping_cart),
//                onPressed: null,
//              ),
//            )
        ],
      ),
      drawer: AppDrawer(),
      body: CourseGride(
        showpath: _showpathedOnly,
      ),
    );
  }
}
