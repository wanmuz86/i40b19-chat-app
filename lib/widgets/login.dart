import 'package:chat_app/widgets/forgotpassword.dart';
import 'package:chat_app/widgets/namelist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var emailTextEditingController = TextEditingController();
  var passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
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
            TextField(
              controller: passwordTextEditingController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your Password"
              ),
            ),
            FlatButton(
              child: Text("Login"),
              color:Colors.yellow,
              onPressed: () async {
                // Navigator.push(context, MaterialPageRoute(builder:(context)=>NameListPage()));
                var user = (await _auth.signInWithEmailAndPassword(email:emailTextEditingController.text.toString().trim(),
                password: passwordTextEditingController.text)).user;
                if (user != null){
                  print("Succesfully logged in!");
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>NameListPage(currentUserId:user.uid)));
                }
                else {
                  print("Something is wrong");
                }
              },
            ),
            FlatButton(
              child: Text("No account? Sign up now!"),

              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>SignupPage()));
              },
            ),
            FlatButton(
              child: Text("Forgot Password"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>ForgotPasswordPage()));
              },
            ),
          ],
        ),
      )
    );
  }
}
