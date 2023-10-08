import 'package:jalseva/models/post.dart';

class PostService {
  static Future<List<Post>> fetchPosts({int startIndex = 0, int limit = 10}) async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));

    // Generate some dummy posts
    List<Post> posts = List.generate(
      limit,
      (index) => Post(
        id: startIndex + index,
        title: 'Post ${startIndex + index}',
        description: 'This is the description for post ${startIndex + index}.',
        imageUrl: 'https://picsum.photos/200/300?random=${startIndex + index}',
        likes: 0,
        comments: 0,
        shares: 0,
      ),
    );

    return posts;
  }
}