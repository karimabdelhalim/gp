import 'package:flutter/material.dart';
import 'package:gp1/provider/cources.dart';
import 'package:gp1/provider/course.dart';
import 'package:gp1/widget/app_drawer.dart';
import 'package:provider/provider.dart';

class SelectItem extends StatefulWidget {
  static const routename = '/course-select';
  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  List<String> droplist = ['a', 'x', 'd', 'g'];
  String selectoptiontest = 'a';
  List<Course> selectoption = List<Course>(12); //= List<Course>(10);
  List<Course> selectedItem = List<Course>();
  Course ss;
  // final listo = ModalRoute.of(context).settings.arguments as List;
//  Course makeSelect(Course item) {
//    Course newitem;
//    setState(() {
//      newitem = item;
//    });
//
//    return newitem;
//  }

  @override
  Widget build(BuildContext context) {
    var providerdata = Provider.of<Courses>(context);
    List<Course> itemlist = providerdata.items;

//    selectoption = [
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1],
//      itemlist[1]
//    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('select course '),
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[0] = newvalue;

                      print(selectoption[0].name);
                    });
                  },
                  value: selectoption[0],
                ),
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[1] = newvalue;

                      print(selectoption[1].name);
                    });
                  },
                  value: selectoption[1],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[2] = newvalue;

                      print(selectoption[2].name);
                    });
                  },
                  value: selectoption[2],
                ),
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[3] = newvalue;

                      print(selectoption[3].name);
                    });
                  },
                  value: selectoption[3],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[4] = newvalue;

                      print(selectoption[4].name);
                    });
                  },
                  value: selectoption[4],
                ),
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[5] = newvalue;

                      print(selectoption[5].name);
                    });
                  },
                  value: selectoption[5],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[6] = newvalue;

                      print(selectoption[6].name);
                    });
                  },
                  value: selectoption[6],
                ),
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[7] = newvalue;

                      print(selectoption[7].name);
                    });
                  },
                  value: selectoption[7],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[8] = newvalue;

                      print(selectoption[8].name);
                    });
                  },
                  value: selectoption[8],
                ),
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[9] = newvalue;

                      print(selectoption[9].name);
                    });
                  },
                  value: selectoption[9],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[10] = newvalue;

                      print(selectoption[10].name);
                    });
                  },
                  value: selectoption[10],
                ),
                DropdownButton(
                  hint: Text("select Course"),
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    setState(() {
                      selectoption[11] = newvalue;

                      print(selectoption[11].name);
                    });
                  },
                  value: selectoption[11],
                ),
              ],
            ),
//
          ],
        ),
      ),
    );
  }
}
