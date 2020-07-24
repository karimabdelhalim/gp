import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp1/provider/user_data.dart';
import 'package:gp1/screen/auth_screen.dart';
import 'package:gp1/screen/overviewscreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
//        print(loggedInUser.email);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
//    getCurrentUser();
    final user = Provider.of<User>(context);
    if (user == null) {
      print(' i am in auth screen');
      return AuthScreen();
    } else {
      print(' i am in over view screen');
//      print(loggedInUser.email);
      return CourseOverviewScreen();
    }
  }
}
