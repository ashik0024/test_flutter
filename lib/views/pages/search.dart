import 'package:flutter/material.dart';
import 'package:test_flutter_001/network/api_service.dart';

import '../../network/DataClass/post_model.dart';
import 'CardItem.dart';



class SearchPage extends StatefulWidget {
   SearchPage({super.key, required this.tittle});

  final String tittle;

  @override
  State<SearchPage> createState() => _SearchPageState();
}
late Future<List<Post>> futurePosts;
class _SearchPageState extends State<SearchPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futurePosts=ApiService().fetchPosts();
    // Wait for the Future to complete, then print the data
    futurePosts.then((posts) {
      for (var post in posts) {
        print('futurePosts: Post ID: ${post.id}, Title: ${post.title}');
      }
    }).catchError((error) {
      print('futurePosts: Error fetching posts: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futurePosts,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          }

          // Data is ready
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return CardItem(
                title: post.title,
                description: post.body,
              );
            },
          );
        });
  }
}
