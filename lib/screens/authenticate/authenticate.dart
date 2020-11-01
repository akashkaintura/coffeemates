import 'package:coffeemate/screens/authenticate/register.dart';
import 'package:coffeemate/services/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _Authenticate createState() => _Authenticate();
}

class _Authenticate extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(viewPage: toggleView);
    } else {
      return Register(viewPage: toggleView);
    }
  }
}
