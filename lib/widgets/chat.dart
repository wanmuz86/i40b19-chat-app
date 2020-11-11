import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List messages = [
    {"from": "Muzaffar", "message": "Hallo", "date": "11/11 20:30"},
    {"from": "Husna", "message": "Yes nak apa!", "date": "11/11 20:40"},
    {"from": "Muzaffar", "message": "Jom malan", "date": "11/11 20:41"},
    {"from": "Muzaffar", "message": "Aku tunggu", "date": "11/11 20:42"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Column(
          children: [
            Row(children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(hintText: "Enter message"),
              )
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {},
                child: Text("Send"),
              )

            ]),
            Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text(messages[position]["from"]),
                        subtitle: Text(messages[position]["message"]));
                  }),
            )
          ],
        ));
  }
}
