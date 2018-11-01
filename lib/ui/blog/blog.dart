import 'package:aristys_app/data/repository.dart';
import 'package:aristys_app/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Post>>(
      future: Repository.get().getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        List<Post> posts = [];
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? new PostList(posts: snapshot.data)
            : new Center(child: new CircularProgressIndicator());
      },
    ));
  }
}

class PostList extends StatelessWidget {
  final List<Post> posts;

  PostList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: posts.length,
      itemBuilder: (BuildContext context, i) {
        return Card(
          elevation: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.network(posts[i].imgURL),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(posts[i].date),
                    SizedBox(height: 8.0),
                    Text(posts[i].title),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
