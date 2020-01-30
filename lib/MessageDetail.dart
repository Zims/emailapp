import 'package:emailapp/MessageCompose.dart';
import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String body;

  MessageDetail(this.subject, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(this.body),
        ),
      ),
    );
  }
}
