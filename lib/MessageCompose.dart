import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose message'),
      ),
      body: Center(
        child: Text('new message'),
      ),
    );
  }
}
