// ignore: file_names
import 'package:blog_flutter/Models/post_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> loginBlog(String email, String password) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('GET', Uri.parse('http://10.0.2.2:3000/api/v1/home'));
  request.body = json.encode({"Email": email, "Password": password});
  request.headers.addAll(headers);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var data = json.decode(responseBody);
      var token = data['val'];
      saveToken(token);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') ?? '';
}

Future<List<Post>> getPosts() async {
  try {
    var headers = {'x-api-key': await getToken()};
    var request =
        http.Request('GET', Uri.parse('http://10.0.2.2:3000/api/v1/posts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responseBody = await response.stream.bytesToString();
    Iterable data = json.decode(responseBody) as List;
    List<Post> posts = data.map((i) => Post.fromJson(i)).toList();
    return posts;
  } catch (e) {
    print(e);
    throw Exception('An error occurred while fetching posts.');
  }
}
