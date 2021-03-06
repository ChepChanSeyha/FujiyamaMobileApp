import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fujiyama/screens/home/home.dart';
import 'package:fujiyama/shared/loading.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController passwordInputController;
  TextEditingController userNameInputController;
  TextEditingController phoneInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    userNameInputController = new TextEditingController();
    phoneInputController = new TextEditingController();
    super.initState();
  }

  bool _obscureText = true;
  bool loading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding:
            EdgeInsets.all(30.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/icon.png',
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                      val.isEmpty ? 'Enter your email' : null,
                      decoration: InputDecoration(
                        labelText: "Email *",
                          hintText: "jonhson@example.com", icon: Icon(Icons.email)),
                      controller: emailInputController,
                    ),
                    TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Password must more than 6 characters'
                          : null,
                      decoration: InputDecoration(
                        labelText: "Password *",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              semanticLabel: _obscureText
                                  ? 'show password'
                                  : 'hide password',
                            ),
                          ),
                          hintText: "*******",
                          icon: Icon(Icons.vpn_key)),
                      controller: passwordInputController,
                      obscureText: _obscureText,
                    ),
                    TextFormField(
                      validator: (val) =>
                      val.isEmpty ? 'Enter your your user name' : null,
                      decoration: InputDecoration(
                        labelText: "Username *",
                          hintText: "Jonh Son", icon: Icon(Icons.account_circle)),
                      controller: userNameInputController,
                    ),
                    TextFormField(
                      validator: (val) =>
                      val.isEmpty ? 'Enter your phone number' : null,
                      decoration: InputDecoration(
                        labelText: "Phone *",
                          hintText: "0** *******",
                          icon: Icon(Icons.phone_iphone)),
                      controller: phoneInputController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Color(0xffE91403),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailInputController.text, password: passwordInputController.text).then((currentUser) => Firestore.instance
                              .collection("users")
                              .document(currentUser.user.uid)
                              .setData({
                            "userID": currentUser.user.uid,
                            "userEmail": currentUser.user.email,
                            "userPassword": passwordInputController.text,
                            "userName": userNameInputController.text,
                            "userPhone": phoneInputController.text,
                          }).then((result) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
                              Home()), (_) => false),))
                              .catchError((err) => print(err))
                              .catchError((err) => print(err));
                          if (result == null) {
                            setState(() {
                              error = 'Something went wrong';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Text('Sign In',
                                  style: TextStyle(
                                    color: Color(0xffE91403),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ))
                            ],
                          ),
                          onTap: () {
                            widget.toggleView();
                          },
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
