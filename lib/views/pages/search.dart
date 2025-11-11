import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_001/network/api_service.dart';

import '../../network/DataClass/post_model.dart';
import '../data/fetch_post_provider.dart';
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
    // kick off fetch once
    Future.microtask(() => context.read<FetchListProvider>().fetchPostListData());

  }
  @override
  Widget build(BuildContext context) {

    final provider = context.watch<FetchListProvider>();

    return  RefreshIndicator(
        onRefresh: () => context.read<FetchListProvider>().fetchPostListData(),
        child: Builder(
          builder: (_) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.error != null) {
              return ListView(

                children: [
                  const SizedBox(height: 120),
                  Center(child: Text('Error: ${provider.error}')),
                  const SizedBox(height: 12),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => context.read<FetchListProvider>().fetchPostListData(),
                      child: const Text('Retry'),
                    ),
                  ),
                ],
              );
            }
            if (provider.postList.isEmpty) {
              return ListView(
                children: const [
                  SizedBox(height: 120),
                  Center(child: Text('No data found')),
                ],
              );
            }

            final List<Post> posts = provider.postList;
            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return CardItem(
                  title: post.title,
                  description: post.body,
                );
              },
            );
          },
        ),
      );

  }
}
