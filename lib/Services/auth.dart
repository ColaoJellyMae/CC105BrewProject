import 'package:brew/Services/database.dart';
import 'package:brew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

// create database.dart

//usage of newer version  (FirebaseUser -> User) | (User -> Customclassname) |
//(AuthResult -> UserCredential)

class AuthService {
  //4th video tutorial = signing in anonymously
  //_auth is used for private

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser

  Customclassname _userFromFirebaseUser(User user) {
    //used to put condition
    return user != null ? Customclassname(uid: user.uid) : null;
  }

  //auth change user stream, we can get the value and change the value whatever we wanted
  Stream<Customclassname> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign for anonymous
  Future signAnonymous() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign with email and password
  Future signInWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

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
