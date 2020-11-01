import 'package:coffeemate/models/user.dart';
import 'package:coffeemate/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:coffeemate/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:coffeemate/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
