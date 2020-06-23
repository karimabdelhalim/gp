import 'package:flutter/material.dart';
import 'package:gp1/provider/course.dart';
import 'package:provider/provider.dart';

class Courses with ChangeNotifier {
  List<Course> _items = [
    Course(
        id: 'cs1',
        description: ' how the computer begine',
        name: 'CS',
        package: 'faculty requirment',
        level: 2,
        hours: 3),
    Course(
        id: 'is1',
        description: ' how the manage data',
        name: 'IS',
        package: 'general requirment',
        level: 3,
        hours: 3),
    Course(
        id: 'E1',
        description: ' how the understand computer terminology',
        name: 'it',
        package: 'specialization requirment',
        level: 4,
        hours: 3),
  ];
  Course _selectedItem;
  // Course get selected => _selectedItem;
  void setSelectedItem(Course s) {
    _selectedItem = s;
    notifyListeners();
  }

  Course get selected {
    notifyListeners();
    return _selectedItem;
  }

  List<Course> get items {
    return [..._items];
  }

  List<Course> get patheditems {
    notifyListeners();
    return _items.where((courseItem) => courseItem.ispath).toList();
  }

  int get coursecount {
    return patheditems.length;
  }

  Course findbyid(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Course> recomend(List<Course> cor, int level, String field) {
    cor.removeWhere((item) => item.ispath == true);
    cor.removeWhere((item) => item.level > level);
  }
}
