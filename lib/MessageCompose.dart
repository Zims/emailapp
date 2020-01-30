import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compose message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Compose a new message",
                style: Theme.of(context).textTheme.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text("Love"),
                  onPressed: () {
                    Navigator.pop(context, "Love");
                  },
                ),
                RaisedButton(
                  child: Text("Hate"),
                  onPressed: () {
                    Navigator.pop(context, "Hate");

                  },
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
