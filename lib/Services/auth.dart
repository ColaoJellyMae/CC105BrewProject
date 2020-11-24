import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {
  //4th video tutorial = signing in anonymously
  //_auth is used for private

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on Firebaseuser

  User _userFromFirebaseUser(FirebaseUser user){
    
    //used to put condition
    return user !=null ? User(uid:user.uid): null;
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
}
