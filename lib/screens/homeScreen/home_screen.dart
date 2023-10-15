import 'package:flutter/material.dart';
import 'package:jalseva/components/postCard.dart';
import 'package:jalseva/models/post.dart';
import 'package:jalseva/services/post_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Post> _posts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchPosts() async {
    setState(() {
      _isLoading = true;
    });
    List<Post> posts = await PostService.fetchPosts();
    setState(() {
      _isLoading = false;
      _posts.addAll(posts);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _scrollController,
              itemCount: _posts.length,
              itemBuilder: (BuildContext context, int index) {
                Post post = _posts[index];
                return PostCard(post: post);
              },
            ),
    );
  }
}
