import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;

  MessageBubble({required this.message, required this.isMe, required this.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: isMe
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  bottomLeft:
                      !isMe ? Radius.circular(0) : Radius.circular(16.0),
                  bottomRight:
                      isMe ? Radius.circular(0) : Radius.circular(16.0))),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Text(
            message,
            style: TextStyle(
                color: Theme.of(context).accentTextTheme.headline1!.color),
          ),
        )
      ],
    );
  }
}
