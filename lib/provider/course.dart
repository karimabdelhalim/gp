import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Course with ChangeNotifier {
  final String courseType;
  final String id;
  final String name;

  final int hours;
  final String catrgory;
  final String status;

  final String dependon;
  bool ispass;
  bool isenroll;
  Course(
      {this.id,
      this.name,
      this.courseType,
      this.hours,
      this.isenroll = false,
      this.ispass = false,
      this.catrgory,
      this.status = 'non',
      this.dependon = 'non'});
  void toggelenroll(bool enroll) {
    isenroll = enroll;
  }

  void toggelpath() {
    ispass = !ispass;
    notifyListeners();
  }
}
