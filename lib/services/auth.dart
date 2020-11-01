import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //private property

  // sign in anonymous
  Future signInAnon() async {
    try {
      AuthResult result =
          await _auth.signInAnonymously(); //only if enable in firebase
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
