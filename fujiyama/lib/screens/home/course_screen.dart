import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Firestore _fireStore = Firestore.instance;
  List<DocumentSnapshot> _courses = [];
  bool _loadingCourse = true;

  _getCourse() async {
    Query query = _fireStore.collection('course');

    setState(() {
      _loadingCourse = true;
    });

    QuerySnapshot querySnapshot = await query.getDocuments();
    _courses = querySnapshot.documents;
    print(_courses);

    setState(() {
      _loadingCourse = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/startup.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.4,
                  right: MediaQuery.of(context).size.width / 3.4,
                  child: Text(
                    'COURSE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontSize: 38),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: _loadingCourse == true
                ? Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  )
                : Container(
                    child: _courses.length == 0
                        ? Center(
                            child: Text('No course to show'),
                          )
                        : ListView.builder(
                            itemCount: _courses.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return Container(
                                color: Colors.red,
                                child: ListTile(
                                  title: Text(_courses[index].data['title']),
                                  subtitle:
                                      Text(_courses[index].data['description']),
                                ),
                              );
                            },
                          )),
          )
        ],
      ),
    );
  }
}
