import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign Up"),),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("My Chat app"),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter your email"
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                ),
              ),
              FlatButton(
                child: Text("Sign Up"),
                color:Colors.yellow,
                onPressed: (){

                },
              ),

            ],
          ),
        )
    );
  }
}
