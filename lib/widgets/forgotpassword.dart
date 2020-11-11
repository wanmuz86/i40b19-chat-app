import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forgot Password"),),
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
              FlatButton(
                child: Text("Forgot Password"),
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
