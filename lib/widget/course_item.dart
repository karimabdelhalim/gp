import 'package:flutter/material.dart';
import 'package:gp1/provider/course.dart';
import 'package:gp1/screen/detail_screen.dart';
import 'package:provider/provider.dart';
//import 'package:gallery/l10n/gallery_localizations.dart';

class CoursetItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final course = Provider.of<Course>(
      context,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.00),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(CourseDetailScreen.routename, arguments: course.id);
          },
          child: Image(
            image: AssetImage('images/CourseFiel.png'),
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Course>(
            builder: (context, course, _) => FlatButton(
              color: Colors.black12,
              onPressed: () {
                course.toggelpath();
              },
              child: course.ispath
                  ? Text(
                      "Pathed",
                      style: TextStyle(color: Colors.red),
                    )
                  : Text(
                      "Path",
                      style: TextStyle(color: Colors.green),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

//class _ToggleButtonsDemo extends StatefulWidget {
//  @override
//  _ToggleButtonsDemoState createState() => _ToggleButtonsDemoState();
//}
//
//class _ToggleButtonsDemoState extends State<_ToggleButtonsDemo> {
//  final isSelected = <bool>[false];
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: ToggleButtons(
//        children: const [Text('enroll')],
//        onPressed: (index) {
//          setState(() {
//            isSelected[index] = !isSelected[index];
//          });
//        },
//        isSelected: isSelected,
//      ),
//    );
//  }
//}
