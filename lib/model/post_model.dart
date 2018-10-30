class Post {
  String title;
  String date;
  String imgURL;
  String content;

  Post({this.title, this.date, this.imgURL, this.content});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      title: json['title'] as String,
      date: json['date'] as String,
      imgURL: json['featured_image'] as String,
      content: json['content'] as String,
    );
  }
}