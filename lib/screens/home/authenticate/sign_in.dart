import 'package:brew/Services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
       
       //used in calling for using the method from AuthService methods

        final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0,
          ),
          child: RaisedButton(
            child: Text('Sign In Anonymously'),
            onPressed: () async{
dynamic  result = await _auth.signAnonymous();
          if (result == null){
            print('error signing in');
          }
          else{
            print('signed in');
            print(result.uid);
          }
            }
            ),
          ),
          );
  }
}
