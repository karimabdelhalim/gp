import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Course with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final int hours;
  final int level;
  final String package;
  bool ispath;
  bool isenroll;
  Course(
      {this.id,
      this.level,
      this.description,
      this.hours,
      this.name,
      this.package,
      this.isenroll = false,
      this.ispath = false});
  void toggelenroll(bool enroll) {
    isenroll = enroll;
  }

  void toggelpath() {
    ispath = !ispath;
    notifyListeners();
  }
}
