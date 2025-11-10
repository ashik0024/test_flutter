import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_flutter_001/network/DataClass/post_model.dart';


class ApiService {
 static const String baseUrl = 'https://jsonplaceholder.typicode.com';
 final Duration timeoutDuration = const Duration(seconds: 10);

 /// 🔹 Generic GET request function
 Future<dynamic> getRequest(String endpoint) async {
  final url = Uri.parse('$baseUrl$endpoint');
  print('api_service GET: $url');

  try {
   final response = await http.get(url).timeout(timeoutDuration);

   print('api_service Response [${response.statusCode}]: ${response.body.substring(0, response.body.length > 200 ? 200 : response.body.length)}');

   if (response.statusCode == 200) {
    return jsonDecode(response.body);
   } else {
    throw HttpException('api_service Request failed with status: ${response.statusCode}');
   }
  } on http.ClientException catch (e) {
   throw HttpException('api_service Client error: ${e.message}');
  } on FormatException {
   throw HttpException('api_service Invalid response format');
  } on Exception catch (e) {
   throw HttpException('api_service Unexpected error: $e');
  }
 }

 /// 🔹 Generic POST request
 Future<dynamic> postRequest(String endpoint, Map<String, dynamic> body) async {
  final url = Uri.parse('$baseUrl$endpoint');
  final headers = {'Content-Type': 'application/json'};

  final response = await http
      .post(url, headers: headers, body: jsonEncode(body))
      .timeout(timeoutDuration);

  if (response.statusCode == 200 || response.statusCode == 201) {
   return jsonDecode(response.body);
  } else {
   throw Exception('POST failed with status: ${response.statusCode}');
  }
 }

 /// 🔹 Fetch posts
 Future<List<Post>> fetchPosts() async {
  final data = await getRequest('/posts');
  return (data as List).map((json) => Post.fromJson(json)).toList();
 }




 }