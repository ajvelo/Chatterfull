// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/wPsDthnVPj1lOBI3h94Y/messages')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = snapshot.data.documents;
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(documents[index]['text']),
              );
            },
            itemCount: documents.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firestore.instance
              .collection('chats/wPsDthnVPj1lOBI3h94Y/messages')
              .add({'text': 'Test'});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
