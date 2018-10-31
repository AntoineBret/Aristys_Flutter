import 'package:meta/meta.dart';

class Post {
  static final db_id = "ID";
  static final db_title = "title";
  static final db_date = "date";
  static final db_imgURL = "featured_image";
  static final db_content = "content";

  String id;
  String title;
  String date;
  String imgURL;
  String content;
  bool starred;

  Post({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.imgURL,
    @required this.content,
    this.starred = false,
  });

  Post.fromMap(Map<String, dynamic> map): this(
    id: map[db_id],
    title: map[db_title],
    date: map[db_date],
    imgURL: map[db_imgURL],
    content: map[db_content],
  );

  // Currently not used
  Map<String, dynamic> toMap() {
    return {
      db_id: id,
      db_title: title,
      db_date: date,
      db_imgURL: imgURL,
      db_content: content,
    };
  }
}
