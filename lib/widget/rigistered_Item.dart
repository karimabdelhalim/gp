import 'package:flutter/material.dart';
import 'package:gp1/provider/course.dart';

class RegisteredItem extends StatelessWidget {
  final String name;
  final String id;
  final String package;
  RegisteredItem({this.name, this.package, this.id});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
              title: Text(name),
              subtitle: Text(package),
              trailing: FlatButton(
                onPressed: null,
                child: Text(
                  "register",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              )),
        ],
      ),
    );
  }
}
