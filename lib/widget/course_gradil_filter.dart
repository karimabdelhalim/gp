import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/provider/course.dart';
import 'package:provider/provider.dart';

import 'course_item.dart';

//class CourseGradilFilter extends StatelessWidget {
//  final String data;
//  CourseGradilFilter({this.data = 'items'});
//  @override
//  Widget build(BuildContext context) {
//    final coursetdata = Provider.of<Courses>(context).items;
//    final course = coursetdata.where((item) => item.package == data).toList();
//    return GridView.builder(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2,
//          childAspectRatio: 3 / 2,
//          crossAxisSpacing: 10,
//          mainAxisSpacing: 10),
//      padding: const EdgeInsets.all(10.0),
//      itemCount: course.length,
//      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//        value: course[i],
//        child: CoursetItem(
////          title: product[i].title,
////          id: product[i].id,
////          imgurl: product[i].imgurl,
//            ),
//      ),
//    );
//  }
//}
