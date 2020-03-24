import 'package:flutter/material.dart';
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
                        fit: BoxFit.cover,
                        ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _circleStyle('Course'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _circleStyle('Status'),
                          SizedBox(
                            width: 15,
                          ),
                          _circleStyle('Play'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _circleStyle(String text) {
  return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Container(
        alignment: Alignment.center,
        child: _title(text),
      )
  );
}

Widget _title(String text) {
  return Text(text);
}
