import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Text('test'),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
