import 'package:flutter/material.dart';
import 'package:login_signup/models/brew.dart';
import 'package:login_signup/screens/home/brew_list.dart';
import 'package:login_signup/screens/home/settings_form.dart';
import 'package:login_signup/services/auth.dart';
import 'package:login_signup/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    _showSettingsPanel()
    {
      showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: SettingsForm(),
          );
        }
      );
    }
    return Container(
      child: StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
              child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew Crew'),
            backgroundColor: Colors.grey[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Logout'),
                onPressed: () async{
                  await _auth.signOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
          body: BrewList(),
        ),
      )
    );
  }
}