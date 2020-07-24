import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gp1/provider/course.dart';
import 'package:provider/provider.dart';

class Courses with ChangeNotifier {
  List<Course> _items = [
//    Course(
//        id: 'cs1',
//        courseType: 'mandatory',
//        name: 'CS',
//        catrgory: 'faculty requirment',
//        hours: 3),
//    Course(
//        id: 'is1',
//        courseType: 'mandatory',
//        name: 'IS',
//        catrgory: 'general requirment',
//        hours: 3),
//    Course(
//        courseType: 'optional ',
//        id: 'E1',
//        name: 'it',
//        catrgory: 'specialization requirment',
//        hours: 3),
  ];
  // Course _selectedItem;
  final _firestore = Firestore.instance;
  // Course get selected => _selectedItem;
//  void setSelectedItem(Course s) {
//    _selectedItem = s;
//    notifyListeners();
//  }
//
//  Course get selected {
//    notifyListeners();
//    return _selectedItem;
//  }

  List<Course> get items {
    getdata();
    //notifyListeners();
    return [..._items];
  }

  //////////////////////////////////////////////authentication////
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

  //////////////////////////////////////////////authentication////
  //////////update data ///////////////////////////
  Future updatedata(String stausvalue, String courseID) async {
    getCurrentUser();

    final coursestatus = await _firestore.collection('registered_courses');
    return coursestatus
        .document('${loggedInUser}' + '${courseID}')
        .setData({'course': stausvalue});
  }

  Future delet(String courseID) async {
    getCurrentUser();

    final coursestatus = await _firestore.collection('registered_courses');
    return coursestatus.document('${loggedInUser}' + '${courseID}').delete();
  }

  //////////update data ///////////////////////////

  List<Course> get patheditems {
    notifyListeners();
    return _items.where((courseItem) => courseItem.ispass).toList();
  }

  ///////////////////////////////lists///////////////////////////
//  List<FireCourse> fircor = [];
//  List<FireCategory> fircat = [];
//  List<FirCorType> firtyp = [];
  var xxx = 'karim';

  //////////////////////////////////////////////////////test////
  Future<void> getdata() async {
    try {
      final firocourse = await _firestore.collection('courses');
//      var aa = firocourse.document('02S9jwyZWEyGqcYxiHXb').get();
//      aa.then((value) {
//        print(value.data);
//      });

      final List<Course> loadedCourse = [];
      getCurrentUser();
      final coursefiros = await firocourse.getDocuments();
      for (var coursefiro in coursefiros.documents) {
        loadedCourse.add(Course(
          name: coursefiro.data['course_name'],
          id: coursefiro.documentID,
          hours: coursefiro.data['course_hours'],
          dependon: coursefiro.data['course_prerequisite'],
          catrgory: getwithdocumentid(coursefiro.data['course_category_id'],
              'course_category', 'course_category'),
          courseType: getwithdocumentid(
              getwithdocumentid(coursefiro.data['course_category_id'],
                  'course_category', 'course_type_id'),
              'course_type',
              'course_type'),
          status: getwithdocumentid(
              '${loggedInUser.uid}' + '${coursefiro.documentID}',
              'registered_courses',
              'course'),
        ));
        notifyListeners();
      }
      _items = loadedCourse;
      notifyListeners();
      //final messages = await messagesdata.getDocuments();
//    final category =
//        await _firestore.collection('course_category').getDocuments();
      // print(messages.documents[1].data);
//      _firCourse();
//      fircor.forEach((item) => print(item.name));

//      var Listo = messages;
//      for (var message in Listo.documents) {
//        print(message.data['course_name']);
//      }
//      for (var message in messages.documents) {
//        print(message.documentID);
//      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getdocumentid(var docid, var collect, var field) async {
    var item;
    await _firestore.collection(collect).document(docid).get().then((value) {
      item = value.data[field].toString();
      xxx = item;
    });
    // var aa = firocourse.document(docid).get();
//    aa.then((value) {
//      item = value.data[field].toString();
//      xxx = item;
//    });
  }

  String getwithdocumentid(var docid, var collect, var field) {
    getdocumentid(docid, collect, field);

    return xxx.toString();
  }
//
//  Future<List<FireCourse>> _firCourse() async {
//    final course = await _firestore.collection('courses').getDocuments();
//    final List<FireCourse> loadproduct = [];
//    for (var data in course.documents) {
//      loadproduct.add(FireCourse(
//          name: data['course_name'],
//          hour: data['course_hours'].toString(),
//          CategoryID: data['course_category_id']));
//    }
//    fircor = loadproduct;
//    return loadproduct;
//      course.documents.map((doc) {
//      return FireCourse(
//        name: doc.data['course_name'] ?? " ",
//        hour: doc.data['course_hours'] ?? 3,
//        CategoryID: doc.data['course_category_id'] ?? " ",
//      );
//    }).toList();
  // }

//  Stream<List<FireCourse>> get Coursefromfire {
//    return _firestore.collection('courses').snapshots().map(_firCourse);
//  }

//  List<FireCategory> _firCstegory(QuerySnapshot snpchot) {
//    return snpchot.documents.map((doc) {
//      return FireCategory(
//        category: doc.data['course_category'] ?? " ",
//        cortypeID: doc.data['course_type_id'] ?? " ",
//      );
//    }).toList();
//  }
//
//  List<FirCorType> _firType(QuerySnapshot snpchot) {
//    return snpchot.documents.map((doc) {
//      return FirCorType(
//        corType: doc.data['course_type'] ?? " ",
//      );
//    }).toList();
//  }
  //////////////////////////////////////////////////////test////

  int get coursecount {
    return patheditems.length;
  }

  Course findbyid(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

////////////////////////////////////////////////////////////// course recommend//////////
  List<Course> Courseterm(int term) {
    List<Course> cor;
    return _items.where((courseItem) => courseItem.hours == term).toList();
  }

  int courseHour(List<Course> cor) {
    int sum = 0;
    // List<Course> termItem = cor;
    for (var item in cor) {
      sum = sum + item.hours;
    }
    return sum;
  }

  List<Course> removefromlist(List<Course> mainList, List<Course> removedList) {
    //var copyList = mainList;
    for (var item in removedList) {
      mainList.remove(item);
    }
    return mainList;
  }

  List<Course> recomend(List<Course> cor) {
    // chose  the items in the specific term

    List<Course> termItem = cor;
//        _items.where((courseItem) => courseItem.hours == 6).toList();
    List<Course> copytermItem = termItem;
    // select passed and optional item  from course term to  close optional course  in all table
    //  remove passed item

    /// for work item not passed//////////////////////////
    List<Course> itemNOTpassed =
        termItem.where((courseItem) => courseItem.status != 'passed').toList();
    // course failed
    List<Course> failed = itemNOTpassed
        .where((courseItem) => courseItem.status == 'failed')
        .toList();
    //course not passed optional
    List<Course> notPassedOptional = itemNOTpassed
        .where((courseItem) => courseItem.courseType == 'optional')
        .toList();
    // course not passed optional  general requirment
    List<Course> notPassedOptionalGeneral = notPassedOptional
        .where((courseItem) => courseItem.catrgory == 'general requirements')
        .toList();
    // course not passed optional  faculty requirment
    List<Course> notPassedOptionalFaculty = notPassedOptional
        .where((courseItem) => courseItem.catrgory == 'faculty requirements')
        .toList();
    // course not passed optional  specialization requirment
    List<Course> notPassedOptionalspecialization = notPassedOptional
        .where((courseItem) =>
            courseItem.catrgory == 'specialization requirements')
        .toList();

    /// for work item not passed//////////////////////////
    // for analysis  passed optional///////////////////////////////////////////

    List<Course> itempassed =
        termItem.where((courseItem) => courseItem.status == 'passed').toList();
    List<Course> itemoptional = itempassed
        .where((courseItem) => courseItem.courseType == 'optional')
        .toList();
    List<Course> itemgeneral = itemoptional
        .where((courseItem) => courseItem.catrgory == 'general requirements')
        .toList();
    List<Course> itemspaecial = itemoptional
        .where((courseItem) =>
            courseItem.catrgory == 'specialization requirements')
        .toList();
    List<Course> itemfaculty = itemoptional
        .where((courseItem) => courseItem.catrgory == 'faculty requirements')
        .toList();
    List<Course> facultyandGeneralJoin = itemgeneral + itemfaculty;
    // for analysis  passed optional///////////////////////////////////////////
    if (itemspaecial.length == 4) {
//      List<Course> itemNOTpassed = termItem
//          .where((courseItem) => courseItem.status != 'passed')
//          .toList();
//      List<Course> itemoptionaltorev = itemNOTpassed
//          .where((courseItem) => courseItem.courseType == 'optional')
//          .toList();
//      List<Course> itemspaecial = itemoptional
//          .where((courseItem) =>
//              courseItem.catrgory == 'specialization requirment')
//          .toList();
      copytermItem =
          removefromlist(itemNOTpassed, notPassedOptionalspecialization);
    }
    if (facultyandGeneralJoin.length == 8) {
//      List<Course> itemNOTpassed = termItem
//          .where((courseItem) => courseItem.status != 'passed')
//          .toList();
//      List<Course> itemoptional = itemNOTpassed
//          .where((courseItem) => courseItem.courseType == 'optional')
//          .toList();
//      List<Course> itemgeneral = itemoptional
//          .where((courseItem) => courseItem.catrgory == 'general requirment')
//          .toList();
//      List<Course> itemfaculty = itemoptional
//          .where((courseItem) => courseItem.catrgory == 'faculty requirment')
//          .toList();
      // List<Course> facultyandGeneralJoin = itemgeneral + itemfaculty;
      copytermItem = removefromlist(copytermItem, notPassedOptionalFaculty);

      copytermItem = removefromlist(copytermItem, notPassedOptionalGeneral);
    }

    if (courseHour(itempassed) >= 85) {
      copytermItem
          .removeWhere((element) => element.name == 'Graduation Project 1');
    }
//    copytermItem = copytermItem
//        .where((courseItem) => courseItem.status != 'passed')
//        .toList();
    var depenadatItems = copytermItem
        .where((courseItem) => courseItem.dependon != 'non')
        .toList();
    for (var depend in depenadatItems) {
      var zz = copytermItem
          .where((courseItem) =>
              courseItem.id == depend.dependon && courseItem.status != 'passed')
          .toList();
      copytermItem = removefromlist(copytermItem, zz);
    }
    // we need to remove item depend on anothe items

////////////////////////////// we need item  that is user  faield on
    List<Course> mandatoryItems = copytermItem
        .where((courseItem) => courseItem.courseType == 'mandatory')
        .toList();
    List<Course> optionalItems = copytermItem
        .where((courseItem) => courseItem.courseType == 'optional')
        .toList();
    var finalresult = mandatoryItems + optionalItems;
    // cor.removeWhere((item) => item.ispass == true);
    // cor.removeWhere((item) => item.level > 4);
    return finalresult;
  }
  ////////////////////////////////////////////////////////////// course recommend//////////
}
