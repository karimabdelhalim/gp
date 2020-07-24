import 'package:flutter/material.dart';
import 'package:gp1/provider/auth.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/screen/FilterScreen.dart';
import 'package:gp1/screen/select_course.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    var itemlist = Provider.of<Courses>(context).items;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('hello friend'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text('your Courses'),
              leading: Icon(
                Icons.done_all,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              title: Text('manage  Courses'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/user_items');
              },
            ),
            Divider(),
            ListTile(
              title: Text('recommended Courses'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/recommend_course');
              },
            ),
            Divider(),
            ListTile(
              title: Text('registered Courses'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed('/registered_course');
              },
            ),
            Divider(),
            ListTile(
              title: Text('select courses'),
              leading: Icon(
                Icons.import_contacts,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
//              Navigator.of(context).pushNamed(SelectItem.routename, arguments: itemlist);
                Navigator.of(context).pushReplacementNamed('/course-select');
              },
            ),
            Divider(),
            ListTile(
              title: Text('General Requirment '),
              leading: Icon(
                Icons.arrow_right,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FilterScreen.routename,
                    arguments: "general requirment");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Specialization Requirment '),
              leading: Icon(
                Icons.arrow_right,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FilterScreen.routename,
                    arguments: "specialization requirment");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Faculty Requirment '),
              leading: Icon(
                Icons.arrow_right,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FilterScreen.routename,
                    arguments: "faculty requirment");
              },
            ),
            Divider(),
            ListTile(
              title: Text('auth screen '),
              leading: Icon(
                Icons.arrow_right,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/auth');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Log out '),
              leading: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              onTap: () async {
                try {
                  dynamic result = await _auth.signout();
                  // Navigator.of(context).pushReplacementNamed('/auth');
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
