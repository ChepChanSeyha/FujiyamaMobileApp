import 'package:flutter/material.dart';
import 'package:fujiyama/screens/splash_screen.dart';
import 'package:fujiyama/shared/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/home/home.dart';
import 'services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Color(0xffE91403)
        ),
        title: 'Fujiyama',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/Wrapper': (BuildContext context) => Wrapper(),
          '/HomeScreen': (BuildContext context) => Home()
        },
      ),
    );
  }
}
