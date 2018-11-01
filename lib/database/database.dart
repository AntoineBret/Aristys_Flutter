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

  //Create SQLite database
  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "demo.db");
    db = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE $tableName ("
          "${Post.db_date} TEXT,"
          "${Post.db_title} TEXT,"
          "${Post.db_imgURL} TEXT,"
          "${Post.db_content} TEXT"
          ")");
      });
    didInit = true;
  }

  //Select all posts from WordPress API in database
  Future<List<Post>> getAllPosts() async{
    var db = await _getDb();
    var result = await db.rawQuery('SELECT * FROM $tableName');
    if(result.length == 0)return [];
    List<Post> posts = [];
    for(Map<String,dynamic> map in result) {
      posts.add(new Post.fromMap(map));
    }
    print(result);
    return posts;
  }
}
