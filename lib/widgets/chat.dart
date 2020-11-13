import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final peerId;
  final userId;
  ChatPage({this.userId, this.peerId});
  @override
  _ChatPageState createState() => _ChatPageState(userId:this.userId,peerId: this.peerId);
}

class _ChatPageState extends State<ChatPage> {
  final peerId;
  final userId;
  var chatEditingController = TextEditingController();
 _ChatPageState({this.userId,this.peerId});
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
          controller: chatEditingController,
                decoration: InputDecoration(hintText: "Enter message"),
              )
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  var content = chatEditingController.text;
                  var groupChatId;
                  if (userId.hashCode <= peerId.hashCode) {
                    groupChatId = '$userId-$peerId';
                  } else {
                    groupChatId = '$peerId-$userId';
                  }
                  var documentReference =
                  FirebaseFirestore.instance.collection('messages')
                      .doc(groupChatId)
                      .collection(groupChatId)
                      .doc(DateTime.now().millisecondsSinceEpoch.toString());
                 documentReference.set({
                      'idFrom':this.userId,
                      'idTo':this.peerId,
                  'timestamp':DateTime.now().millisecondsSinceEpoch.toString(),
                  'content':content
                    });
                  },

                child: Text("Send"),
              )

            ]),
            Expanded(
              child: ListView.builder(
                  itemCount: 0,
                  itemBuilder: (context, position) {
                    return ListTile(
                        title: Text(""),
                        subtitle: Text(""));
                  }),
            )
          ],
        ));
  }
}
