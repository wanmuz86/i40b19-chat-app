import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var emailTextEditingController = TextEditingController();

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
                controller: emailTextEditingController,
                decoration: InputDecoration(
                    hintText: "Enter your email"
                ),
              ),
              FlatButton(
                child: Text("Forgot Password"),
                color:Colors.yellow,
                onPressed: () async {
                  await _auth.sendPasswordResetEmail(email: emailTextEditingController.text.toString().trim());
                  print("Reset email succesfuly sent!");
                },
              ),

            ],
          ),
        )
    );
  }
}
