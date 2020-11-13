import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter your email"
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                ),
              ),
              FlatButton(
                child: Text("Sign Up"),
                color:Colors.yellow,
                onPressed: () async {
                  var email = emailController.text;
                  var password = passwordController.text;
                  User user = (await
                  _auth.createUserWithEmailAndPassword(email:email.toString().trim(),
                      password:password)).user;
                  if (user != null){
                    print("User succesfully signed up!");

                    // THis is adding a document in a collection
                    // As is I am adding a row in a table  (users) in GDrive
                    FirebaseFirestore.instance.collection('users').doc(user.uid).set({
                      'email':user.email,
                      'id':user.uid,
                      'createdAt':DateTime.now(),
                      'chattingWith':null
                    });
                  }
                  else {
                    print("Something is wrong!");
                  }
                },
              ),

            ],
          ),
        )
    );
  }
}
