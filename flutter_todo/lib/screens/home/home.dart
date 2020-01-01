import 'package:flutter/material.dart';
import 'package:flutter_todo/model/brew.dart';
import 'package:flutter_todo/screens/home/brew_list.dart';
import 'package:flutter_todo/screens/home/settings_form.dart';
import 'package:flutter_todo/screens/services/auth.dart';
import 'package:flutter_todo/screens/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    // TODO: implement build
    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: new Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew Crew'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(Icons.person),
                  label: Text('logout')),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label:Text('settings'),
                onPressed: ()=> _showSettingsPanel(),




              )
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/coffee_bg.png'),
                fit: BoxFit.cover
              )
            ),
              child: BrewList()),
        ));
  }
}
