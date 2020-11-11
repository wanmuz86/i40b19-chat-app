import 'package:chat_app/widgets/chat.dart';
import 'package:flutter/material.dart';
class NameListPage extends StatefulWidget {
  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  List users = [{"name":"Muzaffar", "department":"IT"}, {"name":"Husna",
    "department":"Admin"},
    {"name":"Rezza", "department":"Regulatory"}, {"name":"Hilmi", "department":"IT"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Name List"),),
        body:ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, position){
            return ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> ChatPage()));
              },
            title: Text(users[position]["name"]),
            subtitle: Text(users[position]["department"]),
              trailing: Icon(Icons.chevron_right),
        );
          },
        )
    );
  }
}
