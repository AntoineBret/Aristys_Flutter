import 'dart:async';
import 'dart:io';

import 'package:aristys_app/model/post_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class PostDatabase {
  static final PostDatabase _postDatabase = new PostDatabase._internal();

  final String tableName = "Posts";

  Database db;

  bool didInit = false;

  static PostDatabase get() {
    return _postDatabase;
  }

  PostDatabase._internal();

  Future<Database> _getDb() async {
    if (!didInit) await _init();
    return db;
  }

  Future init() async {
    return await _init();
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "demo.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "${Post.db_id} STRING PRIMARY KEY,"
          "${Post.db_date} TEXT,"
          "${Post.db_title} TEXT,"
          "${Post.db_imgURL} TEXT,"
          "${Post.db_content} TEXT,"
          ")");
    });
    didInit = true;
  }

  /// Get a post by its id, if there is not entry for that ID, returns null.
  Future<Post> getPost(String id) async {
    var db = await _getDb();
    var result = await db
        .rawQuery('SELECT * FROM $tableName WHERE ${Post.db_id} = "$id"');
    if (result.length == 0) return null;
    return new Post.fromMap(result[0]);
  }

  /// Get all posts with ids, will return a list with all the books found
  Future<List<Post>> getPosts(List<String> ids) async {
    var db = await _getDb();
    // Building SELECT * FROM TABLE WHERE ID IN (id1, id2, ..., idn)
    var idsString = ids.map((it) => '"$it"').join(',');
    var result = await db.rawQuery(
        'SELECT * FROM $tableName WHERE ${Post.db_id} IN ($idsString)');
    List<Post> posts = [];
    for (Map<String, dynamic> item in result) {
      posts.add(new Post.fromMap(item));
    }
    return posts;
  }

  /// Inserts or replaces posts.
  Future updatePost(Post post) async {
    var db = await _getDb();
    await db.rawInsert(
        'INSERT OR REPLACE INTO '
        '$tableName(${Post.db_id}, ${Post.db_date}, ${Post.db_title}, ${Post.db_imgURL}, ${Post.db_content})'
        ' VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
        [post.id, post.date, post.title, post.imgURL, post.content]);
  }

  Future close() async {
    var db = await _getDb();
    return db.close();
  }
}
