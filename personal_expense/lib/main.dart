import 'package:flutter/material.dart';
import 'package:personal_expense/screens/services/auth.dart';
import 'package:personal_expense/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';

void main() => runApp(PersonalExpenseApp());

class PersonalExpenseApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Personal Expense',
          home: Wrapper(),
        ));
  }
}
