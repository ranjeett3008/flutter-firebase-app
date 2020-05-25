import 'package:flutter/material.dart';
import 'package:login_signup/models/user.dart';
import 'package:login_signup/screens/home/wrapper.dart';
import 'package:login_signup/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
          home: Wrapper(),
      ),
    );
  }
}


