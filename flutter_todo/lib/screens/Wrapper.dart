import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget{
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