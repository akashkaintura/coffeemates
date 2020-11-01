import 'package:coffeemate/services/auth.dart';
import 'package:coffeemate/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:coffeemate/shared/loading.dart';

class Register extends StatefulWidget {
  final Function viewPage;
  Register({this.viewPage});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  // flutter Global validations
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: Text('Sign up for CoffeeShop'),
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.viewPage();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey, //keep track of form for validation
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      validator: (val) => val.length < 8
                          ? 'password must be 8 character long or more'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      color: Colors.brown[400],
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'please enter valid email';
                              loading = false;
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
