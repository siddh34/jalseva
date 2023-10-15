import 'package:flutter/material.dart';
import 'package:jalseva/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(post.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Likes: ${post.likes}, Comments: ${post.comments}, Shares: ${post.shares}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}