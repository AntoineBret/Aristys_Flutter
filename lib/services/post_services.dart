import 'dart:convert';

import 'package:aristys_app/model/post_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

String url = 'https://public-api.wordpress.com/rest/v1.1/sites/blogaristysweb.wordpress.com/posts/';

Future<List<Post>> loadAllPosts(http.Client client) async {
  final response =
  await client.get(url);

  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parsePosts, response.body);
}

// A function that will convert a response body into a List<Photo>
List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody);

  return (parsed["posts"] as List).map<Post>((json) =>
  new Post.fromJson(json)).toList();
}