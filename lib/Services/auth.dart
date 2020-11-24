import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew/models/user.dart';

class AuthService {
  //4th video tutorial = signing in anonymously
  //_auth is used for private

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    //used to put condition
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream, we can get the value and change the value whatever we wanted
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign for anonymous
  Future signAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign with email and password

  //register with email and password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
