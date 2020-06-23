import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/screen/FilterScreen.dart';
import 'package:gp1/screen/select_course.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemlist = Provider.of<Courses>(context).items;
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('hello friend'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            title: Text('All Courses'),
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
            title: Text('select courses'),
            leading: Icon(
              Icons.import_contacts,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(SelectItem.routename, arguments: itemlist);
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
        ],
      ),
    );
  }
}
