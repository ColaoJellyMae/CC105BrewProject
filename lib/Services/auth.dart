import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //4th video tutorial = signing in anonymously
  //_auth is used for private

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign for anonymous
  Future signAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign with email and password

  //register with email and password
}
