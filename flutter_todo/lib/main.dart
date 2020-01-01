import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/screens/Wrapper.dart';
import 'package:flutter_todo/screens/services/auth.dart';
import 'package:provider/provider.dart';
void main() => runApp(TodoApp());

// Every component in Flutter is a widget, even the whole app itself
class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
        child: new MaterialApp(
      home: Wrapper(),
    ));
  }
}

