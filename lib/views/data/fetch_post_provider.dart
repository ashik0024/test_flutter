
import 'package:flutter/material.dart';
import 'package:test_flutter_001/network/DataClass/post_model.dart';

import '../../network/api_service.dart';

class FetchListProvider extends ChangeNotifier {
  final ApiService _api = ApiService();

  List<Post> postList = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchPostListData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      postList = await _api.fetchPosts();
    } catch (e) {
      error = e.toString();
      postList = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}