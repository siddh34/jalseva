import 'package:flutter/material.dart';
import 'package:jalseva/components/postCard.dart';
import '../../models/post.dart';

import './comment_tile.dart';
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

