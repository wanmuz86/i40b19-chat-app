import 'package:chat_app/widgets/chat.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NameListPage extends StatefulWidget {
  final  currentUserId;
  NameListPage({this.currentUserId});
  @override
  _NameListPageState createState() => _NameListPageState(currentUserId:this.currentUserId);
}

class _NameListPageState extends State<NameListPage> {

  final currentUserId;
  _NameListPageState({this.currentUserId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Name List"),),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              else {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, position) {
                     if (snapshot.data.documents[position]["id"] == this.currentUserId) {
                       return
                      SizedBox(); }
                     else {
                       return ListTile(
                         onTap: () {
                           Navigator.push(context,
                               MaterialPageRoute(
                                   builder: (context) => ChatPage(
                                     userId: this.currentUserId,
                                       peerId:snapshot.data.documents[position]["id"])));
                         },
                         title: Text(
                             snapshot.data.documents[position]["email"]),
                         // subtitle: Text(users[position]["department"]),
                         // trailing: Icon(Icons.chevron_right),
                       );
                     }
                    });
              }
            }
        )

    );
  }
}