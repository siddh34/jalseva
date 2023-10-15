import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  final String username;
  final String comment;
  final DateTime timestamp;

  const CommentTile({
    required this.username,
    required this.comment,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(username[0]),
      ),
      title: Text(username),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(comment),
          SizedBox(height: 4),
          Text(
            '${timestamp.day}/${timestamp.month}/${timestamp.year} ${timestamp.hour}:${timestamp.minute}',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}