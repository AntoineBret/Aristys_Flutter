import 'dart:async';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:aristys_app/data/database.dart';
import 'package:aristys_app/model/post_model.dart';
import 'package:http/http.dart' as http;

/// A class similar to http.Response but instead of a String describing the body
/// it already contains the parsed Dart-Object
class ParsedResponse<T> {
  ParsedResponse(this.statusCode, this.body);

  final int statusCode;
  final T body;

  bool isOk() {
    return statusCode >= 200 && statusCode < 300;
  }
}

final int NO_INTERNET = 404;

class Repository {
  static final Repository _repo = new Repository._internal();

  PostDatabase database;

  static Repository get() {
    return _repo;
  }

  Repository._internal() {
    database = PostDatabase.get();
  }

  Future init() async {
    return await database.init();
  }

  /// Fetches the posts from the WordPress Api with the query parameter being input.
  /// If a post also exists in the local storage that version of the post will be used instead
  Future<ParsedResponse<List<Post>>> getPosts(String input) async {
    //http request, catching error like no internet connection.
    //If no internet is available for example response is
    http.Response response = await http
        .get(
            "https://public-api.wordpress.com/rest/v1.1/sites/blogaristysweb.wordpress.com/posts/")
        .catchError((resp) {});

    if (response == null) {
      return new ParsedResponse(NO_INTERNET, []);
    }

    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, []);
    }

    // Decode and go to the items part where the necessary book information is
    List<dynamic> list = jsonDecode(response.body)['posts'];

    Map<String, Post> networkPosts = {};

    for (dynamic jsonPost in list) {
      Post post = parseNetworkPost(jsonPost);
      networkPosts[post.id] = post;
    }

    //Adds information (if available) from database
    List<Post> databasePost =
        await database.getPosts([]..addAll(networkPosts.keys));
    for (Post post in databasePost) {
      networkPosts[post.id] = post;
    }
    return new ParsedResponse(
        response.statusCode, []..addAll(networkPosts.values));
  }

  Future<ParsedResponse<Post>> getPost(String id) async {
    http.Response response = await http
        .get(
            "https://public-api.wordpress.com/rest/v1.1/sites/blogaristysweb.wordpress.com/posts/$id")
        .catchError((ressp) {});
    if (response == null) {
      return new ParsedResponse(NO_INTERNET, null);
    }

    //If there was an error return null
    if(response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, null);
    }

    dynamic jsonPost = jsonDecode(response.body);

    Post post = parseNetworkPost(jsonPost);

    //Adds information (if available) from database
    List<Post> databasePost = await database.getPosts([]..add(post.id));
    for(Post databasePost in databasePost){
      if(databasePost != null){
        post = databasePost;
      }
    }
    return new ParsedResponse(response.statusCode, post);
  }

  Post parseNetworkPost(jsonPost){

    Map volumeInfo = jsonPost[""];
    //todo
  }

  Future updatePost(Post post) async {
    await database.updatePost(post);
  }

  Future close() async {
    return database.close();
  }
}
