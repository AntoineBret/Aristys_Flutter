import 'package:aristys_app/database/repository.dart';
import 'package:aristys_app/model/post_model.dart';
import 'package:aristys_app/ui/blog/post_details.dart';
import 'package:aristys_app/utils/utils.dart';
import 'package:aristys_app/widget/PostCard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Post>>(
      future: Repository.get().getAllPosts(),
      builder: (context, snapshot) {
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
    return new GridView.builder(
      reverse: true,
      itemCount: posts.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new PostCard(
          post: posts[index],
          onCardClick: () {
            Navigator.of(context).push(new FadeRoute(
              builder: (BuildContext context) =>
                  new PostDetailsPage(posts[index]),
              settings:
                  new RouteSettings(name: '/details', isInitialRoute: false),
            ));
          },
          onStarClick: () {},
        );
        //  return new BookCardMinimalistic(_items[index]);
      },
    );
  }
}
