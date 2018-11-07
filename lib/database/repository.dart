import 'dart:async';
import 'dart:convert';

import 'package:aristys_app/database/database.dart';
import 'package:aristys_app/model/post_model.dart';
import 'package:http/http.dart' as http;

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

  Future<ParsedResponse<List<Post>>> getPosts() async {
    //http request, catching error like no internet connection.
    //If no internet is available for example response is
    http.Response response = await http
        .get(
            "https://public-api.wordpress.com/rest/v1.1/sites/blogaristysweb.wordpress.com/posts?per_page=100")
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
    print("Json WP get = " + response.body);

    Map<String, Post> networkPosts = {};

    for (dynamic jsonPost in list) {
      Post post = parseNetworkPost(jsonPost);
      Repository.get().updatePosts(post);
    }

    return new ParsedResponse(
        response.statusCode, []..addAll(networkPosts.values));
  }

  Post parseNetworkPost(jsonPost) {
    return new Post(
      id: jsonPost["ID"],
      date: jsonPost["date"],
      title: jsonPost["title"],
      imgURL: jsonPost["featured_image"],
      content: jsonPost["content"],
    );
  }

  //Call getAllPosts() in database.dart for rawQuery in db
  Future<List<Post>> getAllPosts() {
    return database.getAllPosts();
  }

  Future updatePosts(Post post) async {
    await database.updatePosts(post);
  }

  Future close() async {
    return database.close();
  }
}
