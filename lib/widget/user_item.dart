import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String name;
  final String id;
  final String brieve;
  UserItem({this.name, this.brieve, this.id});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: Text(brieve),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
//              Navigator.of(context)
//                  .pushNamed(EditScreen.routename, arguments: id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () async {
//              try {
//                await Provider.of<Products>(context, listen: false)
//                    .deleteitem(id);
//              } catch (error) {
//                scafold
//                    .showSnackBar(SnackBar(content: Text('Deleting failed')));
//              }
              },
            )
          ],
        ),
      ),
    );
  }
}
