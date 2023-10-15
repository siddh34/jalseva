import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../homeScreen/home_screen.dart';

class CommentScreen extends StatelessWidget {
  final Post post;

  const CommentScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                PostCard(post: post),
                Divider(),
                CommentTile(
                  username: 'John Doe',
                  comment: 'Great post!',
                  timestamp: DateTime.now(),
                ),
                CommentTile(
                  username: 'Jane Smith',
                  comment: 'Thanks for sharing!',
                  timestamp: DateTime.now(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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