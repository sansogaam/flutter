import 'package:flutter/material.dart';
import 'package:personal_expense/screens/services/auth.dart';
import 'package:personal_expense/shared/constant.dart';
import 'package:personal_expense/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
        backgroundColor: Colors.blueAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[400],
          elevation: 0.0,
          title: Text('Register into Personal Expenses', style: TextStyle(fontSize: 15),),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Sign In"))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length <6  ? 'Enter password 6+ chars long' : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      color: Colors.pinkAccent[400],
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.registeredWithEmailAndPassword(email, password);
                          if(result == null){
                            setState(() {
                              error = 'Please supply a valid email';
                              loading = false;
                            });
                          }
                        }
                      }),
                  SizedBox(height: 12.0,),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0 ),
                  )
                ]))));
  }
}
