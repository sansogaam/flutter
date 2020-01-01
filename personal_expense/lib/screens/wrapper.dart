import 'package:flutter/material.dart';
import 'package:personal_expense/model/user.dart';
import 'package:personal_expense/screens/authenticate/authenticate.dart';
import 'package:personal_expense/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Return either Home or Authenticate
    final user = Provider.of<User>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    }else{
      return Home();
    }
  }
}
