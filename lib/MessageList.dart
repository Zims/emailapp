import 'dart:convert';

import 'package:emailapp/ComposeButton.dart';
import 'package:flutter/material.dart';
import 'Message.dart';
import 'MessageCompose.dart';
import 'MessageDetail.dart';

class MessageList extends StatefulWidget {
  final String title;

  const MessageList({Key key, this.title}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;

  @override
  void initState() {
    super.initState();
    messages = Message.browse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              var _messages = Message.browse();

              setState(() {
                messages = _messages;
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text("there was an error: ${snapshot.error}");
              var messages = snapshot.data;

              return ListView.separated(
                itemCount: messages.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return ListTile(
                    title: Text(message.subject),
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MessageDetail(message.subject, message.body),
                        ),
                      );
                    },
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}
