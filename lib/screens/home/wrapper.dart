import 'package:flutter/material.dart';
import 'package:login_signup/models/user.dart';
import 'package:login_signup/screens/authenticate/authenticate.dart';
import 'package:login_signup/screens/home/home.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    //return either Home or Authenticate  widget
    

    if(user == null)
    {
      return  Authenticate();
    }
    else{
      return Home();
    }
  }
}