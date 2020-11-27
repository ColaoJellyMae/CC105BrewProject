import 'package:brew/Services/auth.dart';
import 'package:brew/screens/wrapper.dart';
import 'package:brew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Customclassname>.value(

//maybe change it later if have problem refer to ss
     
      value: AuthService().user,
        child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}


