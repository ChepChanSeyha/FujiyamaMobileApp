import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fujiyama/screens/home/mainFunctions/course_screen.dart';
import 'package:fujiyama/screens/home/mainFunctions/test.dart';
import 'package:fujiyama/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home'),
//        actions: <Widget>[
//          FlatButton.icon(
//              onPressed: () async {
//                await _auth.signOut();
//              },
//              icon: Icon(
//                Icons.person,
//                color: Colors.white,
//              ),
//              label: Text(
//                'Logout',
//                style: TextStyle(color: Colors.white),
//              ))
//        ],
//      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fitWidth,
                        ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Test()));
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.height/6,
                                width: MediaQuery.of(context).size.width/3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.red,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        height: MediaQuery.of(context).size.height/9,
                                        width: MediaQuery.of(context).size.width/5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        height: MediaQuery.of(context).size.height/9,
                                        width: MediaQuery.of(context).size.width/6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('COURSE', style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.width/3,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.brown,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      height: MediaQuery.of(context).size.height/9,
                                      width: MediaQuery.of(context).size.width/5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      height: MediaQuery.of(context).size.height/9,
                                      width: MediaQuery.of(context).size.width/6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.brown,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('STATUS', style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height/6,
                              width: MediaQuery.of(context).size.width/3,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.red,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      height: MediaQuery.of(context).size.height/9,
                                      width: MediaQuery.of(context).size.width/5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      height: MediaQuery.of(context).size.height/9,
                                      width: MediaQuery.of(context).size.width/6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('PLAY', style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _myStyle(String text) {
  return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.rectangle,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Text(text),
      )
  );
}
