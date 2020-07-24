import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/widget/app_drawer.dart';
import 'package:gp1/widget/rigistered_Item.dart';
import 'package:gp1/widget/user_item.dart';
import 'package:provider/provider.dart';

class UserItemsScreen extends StatelessWidget {
  static const routename = '/user_items';
  @override
  Widget build(BuildContext context) {
    final userCourse = Provider.of<Courses>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('your all Courses data'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Column(
          children: <Widget>[
            Divider(),
            UserItem(
              name: userCourse.items[i].name,
              brieve: userCourse.items[i].courseType,
              id: userCourse.items[i].id,
            )
          ],
        ),
        itemCount: userCourse.items.length,
      ),
    );
  }
}
