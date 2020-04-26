import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fujiyama/authenticate/validator.dart';
import 'package:fujiyama/services/auth.dart';
import 'package:fujiyama/shared/loading.dart';
import 'package:fujiyama/shared/widget.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

// Text field state
  String email = '';
  String password = '';
  String error = '';

  bool _obscureText = true;
  bool loading = false;

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
                            height: MediaQuery.of(context).size.width * 0.87,
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
                                          keyboardType:
                                          TextInputType.emailAddress,
//                                              validator: Validator().validateEmail,
                                          decoration: InputDecoration(
                                              contentPadding:
                                              EdgeInsets.all(15),
                                              hintText: "Email",
                                              border: InputBorder.none),
                                          onChanged: (val) {
                                            setState(() => email = val);
                                          },
                                        ),
                                      ),
                                    ),
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
                                            keyboardType:
                                            TextInputType.text,
                                            autofocus: false,
//                                                validator: Validator().validatePassword,
                                            decoration: InputDecoration(
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
                                              hintText: "Password",
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.all(15),
                                            ),
                                            onChanged: (val) {
                                              setState(
                                                      () => password = val);
                                            },
                                          ),
                                        )),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    RaisedButton(
                                      padding: EdgeInsets.only(
                                          left: 0.0, right: 0.0),
                                      child: customBtn(context, 'LOG IN',
                                          Colors.red, Colors.white),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'Invalid email or password';
                                              loading = false;
                                            });
                                          }
                                        }
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 9, bottom: 9),
                                      child: Container(
                                        child: Text(
                                          'OR',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                      padding: EdgeInsets.only(
                                          left: 0.0, right: 0.0),
                                      child: customBtn(
                                          context,
                                          'CREATE AN ACCOUNT',
                                          Colors.red,
                                          Colors.white),
                                      onPressed: () async {
                                        widget.toggleView();
                                      },
                                    ),
                                  ],
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.85),
                    child: customBtn(context, 'LOG IN WITH FACEBOOK',
                        Colors.blue[800], Colors.white),
                  ),
                ],
              ),
            ),
          );
  }
}
