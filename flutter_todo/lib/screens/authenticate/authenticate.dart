import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/authenticate/register.dart';
import 'package:flutter_todo/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>{

  bool showSignIn = true;

  void toggleView(){
    setState(()=> showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: showSignIn ? SignIn(toggleView: toggleView) : Register(toggleView: toggleView),


    );
  }
}