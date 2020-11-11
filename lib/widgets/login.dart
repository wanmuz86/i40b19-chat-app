import 'package:chat_app/widgets/forgotpassword.dart';
import 'package:chat_app/widgets/namelist.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              decoration: InputDecoration(
                hintText: "Enter your email"
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your Password"
              ),
            ),
            FlatButton(
              child: Text("Login"),
              color:Colors.yellow,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>NameListPage()));
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
