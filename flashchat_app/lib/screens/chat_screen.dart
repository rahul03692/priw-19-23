import 'package:flutter/material.dart';
import 'package:flashchat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
var string;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String msg;
  final mtc=TextEditingController();
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        string = user.email;
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final messages = snapshot.data.docs.reversed;
                  List<MessageBubble> ls = [];
                  for (var msg in messages) {
                    final s = msg.data()['sender'];
                    final t = msg.data()['text'];
                    final widget = MessageBubble(
                      s: s,
                      t: t,
                      isme: (s==string),
                    );
                    ls.add(widget);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      children: ls,
                    ),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: mtc,
                      onChanged: (value) {
                        msg = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      mtc.clear();
                      _firestore
                          .collection('messages')
                          .add({'sender': string, 'text': msg});
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.s, this.t,this.isme});

  final String s, t;
  String x,y;
  bool isme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isme? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            s,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
          Material(
            elevation: 5.0,
            borderRadius: isme ? BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),):BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0)),
            color: isme ? Colors.lightBlueAccent: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                t,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isme ? Colors.white:Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
