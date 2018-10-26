import 'package:flutter/foundation.dart';

enum Category { all}

class Post {
  const Post({
    @required this.posts,
    @required this.title,
    @required this.date,
    @required this.imgURL,
    @required this.content,
  }): assert(posts != null),
        assert(title != null),
        assert(date != null),
        assert(imgURL != null),
        assert(content != null);

  final List<Post> posts;
  final String title;
  final String date;
  final String imgURL;
  final String content;

//  factory Post.fromJson(Map<String, dynamic> json) {
//    return new Post._(
//      posts: json['posts'],
//      title: json['title'],
//      date: json['date'],
//      imgURL: json['featured_image'],
//      content: json['content'],
//    );
//  }
}