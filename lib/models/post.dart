class Post {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  int likes;
  int comments;
  int shares;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}