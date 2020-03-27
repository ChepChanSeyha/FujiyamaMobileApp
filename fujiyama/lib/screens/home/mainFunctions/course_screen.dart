import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
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
                      image: AssetImage("assets/images/head.png"),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width*0.4,
                  right: MediaQuery.of(context).size.width/3,
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.deepOrange,
                    ),
                    height: MediaQuery.of(context).size.height/7,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Hello'),
                            Text('Hello'),
                          ],
                        ),
                        Text('Hello'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
