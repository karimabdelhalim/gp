import 'package:flutter/material.dart';
import 'package:gp1/provider/auth.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/provider/course.dart';
import 'package:gp1/provider/user_data.dart';
import 'package:gp1/screen/FilterScreen.dart';
import 'package:gp1/screen/auth_screen.dart';
import 'package:gp1/screen/detail_screen.dart';
import 'package:gp1/screen/overviewscreen.dart';
import 'package:gp1/screen/recommend_screen.dart';
import 'package:gp1/screen/rigistered_coursecreen.dart';
import 'package:gp1/screen/select_course.dart';
import 'package:gp1/screen/user_items_screen.dart';
import 'package:gp1/screen/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider(
          create: (_) => Courses(),
        ),
      ],
      child: MaterialApp(
        title: 'my shop',
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.deepOrange),
        home: Wrapper(),
        routes: {
          SelectItem.routename: (context) => SelectItem(),
          CourseDetailScreen.routename: (context) =>
              CourseDetailScreen(), //FilterScreen
          FilterScreen.routename: (context) => FilterScreen(),
          RegisteredCoursesScreen.routename: (context) =>
              RegisteredCoursesScreen(),
          RecommendedCoursesScreen.routename: (context) =>
              RecommendedCoursesScreen(), //AuthScreen
          UserItemsScreen.routename: (context) => UserItemsScreen(),
          AuthScreen.routeName: (context) => AuthScreen(),
        },
      ),
    );
  }
}
