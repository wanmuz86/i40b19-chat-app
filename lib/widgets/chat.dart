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
  var groupChatId= '';
  @override
  Widget build(BuildContext context) {
    if (userId.hashCode <= peerId.hashCode) {
      groupChatId = '$userId-$peerId';
    } else {
      groupChatId = '$peerId-$userId';
    }
    print('group chat $groupChatId');
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
              child:
              StreamBuilder(
                  stream:
                  FirebaseFirestore.instance.collection('messages')
                      .doc(groupChatId)
                      .collection(groupChatId).snapshots(),
                  builder: (context,snapshots){
                    if (!snapshots.hasData) {
                      print('tak dapat');
                      return CircularProgressIndicator();
                    }
                    else
                      { return
                      ListView.builder(
                      itemCount: snapshots.data.documents.length,
                      itemBuilder:  (context, position) {
                        return ListTile(
                        title: Text(snapshots.data.documents[position]["idFrom"]),
                      subtitle: Text(snapshots.data.documents[position]["content"]));
                      });

                      }
                    })

            )
          ],
        ));
  }
}
