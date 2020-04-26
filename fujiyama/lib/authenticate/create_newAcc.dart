import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fujiyama/screens/home/home.dart';
import 'package:fujiyama/shared/loading.dart';
import 'package:fujiyama/shared/widget.dart';

class NewAccount extends StatefulWidget {
  final Function toggleView;
  NewAccount({this.toggleView});

  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController passwordInputController;
  TextEditingController userNameInputController;
  TextEditingController phoneInputController;
  TextEditingController dobInputController;
  TextEditingController genderInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    userNameInputController = new TextEditingController();
    phoneInputController = new TextEditingController();
    dobInputController = new TextEditingController();
    genderInputController = new TextEditingController();
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
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: Image.asset(
                      "assets/images/bg_style_top.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.2),
                    child: Text(
                      'START',
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5.0, left: 5.0),
                          child: Image.asset(
                            'assets/images/status_bg_white.png',
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.width * 1.17,
                            color: Colors.white.withOpacity(0.7),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.05),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 25, left: 25),
                                      child: Container(
                                        height: 50,
                                        width: 310,
                                        color: Colors.white,
                                        child: TextFormField(
                                          validator: (val) => val.isEmpty
                                              ? 'Enter your email'
                                              : null,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(15),
                                              hintText: "Email"),
                                          controller: emailInputController,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 25, left: 25),
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 50,
                                              width: 310,
                                              color: Colors.white,
                                              child: TextFormField(
                                                validator: (val) => val.length <
                                                    6
                                                    ? 'Password must more than 6 characters'
                                                    : null,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Password",
                                                  contentPadding: EdgeInsets.all(15),
                                                  suffixIcon: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _obscureText =
                                                        !_obscureText;
                                                      });
                                                    },
                                                    child: Icon(
                                                      _obscureText
                                                          ? Icons.visibility_off
                                                          : Icons.visibility,
                                                      semanticLabel:
                                                      _obscureText
                                                          ? 'show password'
                                                          : 'hide password',
                                                    ),
                                                  ),
                                                ),
                                                controller:
                                                passwordInputController,
                                                obscureText: _obscureText,
                                              ),
                                            ),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 25, left: 25),
                                        child: Container(
                                          height: 50,
                                          width: 310,
                                          color: Colors.white,
                                          child: TextFormField(
                                            validator: (val) => val.isEmpty
                                                ? 'Enter your your user name'
                                                : null,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Full Name",
                                                contentPadding: EdgeInsets.all(15)
                                            ),
                                            controller:
                                            userNameInputController,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 25, left: 25),
                                        child: Container(
                                          height: 50,
                                          width: 310,
                                          color: Colors.white,
                                          child: TextFormField(
                                            validator: (val) => val.isEmpty
                                                ? 'Enter your phone number'
                                                : null,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.all(15),
                                                hintText: "Phone Number"),
                                            controller:
                                            phoneInputController,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            color: Colors.white,
                                            child: TextFormField(
                                              validator: (val) => val.isEmpty
                                                  ? 'Enter your date of birth'
                                                  : null,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.all(15),
                                                  hintText: "Date of birth"),
                                              controller:
                                              dobInputController,
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width * 0.3,
                                            color: Colors.white,
                                            child: TextFormField(
                                              validator: (val) => val.isEmpty
                                                  ? 'Enter your gender'
                                                  : null,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  contentPadding: EdgeInsets.all(15),
                                                  hintText: "Gender"),
                                              controller:
                                              genderInputController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    RaisedButton(
                                      padding: EdgeInsets.only(
                                          left: 0.0, right: 0.0),
                                      child: customBtn(context, 'CREATE',
                                          Colors.red, Colors.white),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await FirebaseAuth
                                              .instance
                                              .createUserWithEmailAndPassword(
                                                  email:
                                                      emailInputController.text,
                                                  password:
                                                      passwordInputController
                                                          .text)
                                              .then((currentUser) => Firestore
                                                      .instance
                                                      .collection("users")
                                                      .document(
                                                          currentUser.user.uid)
                                                      .setData({
                                                    "userID":
                                                        currentUser.user.uid,
                                                    "userEmail":
                                                        currentUser.user.email,
                                                    "userPassword":
                                                        passwordInputController
                                                            .text,
                                                    "userName":
                                                        userNameInputController
                                                            .text,
                                                    "userPhone":
                                                        phoneInputController
                                                            .text,
                                                  }).then(
                                                    (result) => Navigator
                                                        .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Home()),
                                                            (_) => false),
                                                  ))
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
                                      height: 9,
                                    ),
                                    RaisedButton(
                                      padding: EdgeInsets.only(
                                          left: 0.0, right: 0.0),
                                      child: customBtn(context, 'BACK',
                                          Colors.red, Colors.white),
                                      onPressed: () async {
                                        widget.toggleView();
                                      },
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
