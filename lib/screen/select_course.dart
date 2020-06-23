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
  List<Course> selectoption = List<Course>(10);
  Course ss;
  // final listo = ModalRoute.of(context).settings.arguments as List;

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
                  // value: selectcourse[0],
                  items: droplist.map((String cor) {
                    return DropdownMenuItem<String>(
                      child: Text(cor),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      selectoptiontest = newvalue;
                    });

                    print(newvalue);
                  },
                  value: selectoptiontest,
                ),
                DropdownButton(
                  // value: selectcourse[0],
                  items: itemlist.map<DropdownMenuItem<Course>>((Course cor) {
                    return DropdownMenuItem<Course>(
                      child: Text(cor.name),
                      value: cor,
                    );
                  }).toList(),
                  onChanged: (Course newvalue) {
                    providerdata.setSelectedItem(newvalue);
                    setState(() {
                      ss = providerdata.selected;
                      //  selectoption[1] = providerdata.selected;
                    });

                    print(ss.name);
                  },
                  value: ss,
                ),
              ],
            ),
//          Row(
//            children: <Widget>[
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (Course newvalue) {
//                  setState(
//                    () {
//                      selectoption[2] = newvalue;
//                    },
//                  );
//                  print(newvalue.name);
//                },
//                value: selectoption[2],
//              ),
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[3] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[3],
//              ),
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[4] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[4],
//              ),
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[5] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[5],
//              ),
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[6] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[6],
//              ),
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[7] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[7],
//              ),
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[8] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[8],
//              ),
//              DropdownButton(
//                // value: selectcourse[0],
//                items: itemlist.map((Course cor) {
//                  return DropdownMenuItem<Course>(
//                    child: Text(cor.name),
//                    value: cor,
//                  );
//                }).toList(),
//                onChanged: (newvalue) {
//                  setState(
//                    () {
//                      selectoption[9] = newvalue;
//                    },
//                  );
//                },
//                value: selectoption[9],
//              ),
//            ],
//          ),
////
          ],
        ),
      ),
    );
  }
}
