import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/provider/course.dart';
import 'package:gp1/screen/FilterScreen.dart';
import 'package:gp1/screen/detail_screen.dart';
import 'package:gp1/screen/overviewscreen.dart';
import 'package:gp1/screen/select_course.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Courses(),
        ),
      ],
      child: MaterialApp(
        title: 'my shop',
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.deepOrange),
        home: CourseOverviewScreen(),
        routes: {
          SelectItem.routename: (context) => SelectItem(),
          CourseDetailScreen.routename: (context) => CourseDetailScreen(),//FilterScreen
          FilterScreen.routename: (context) => FilterScreen(),
        },
      ),
    );
  }
}
