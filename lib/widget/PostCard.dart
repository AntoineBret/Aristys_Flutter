import 'package:aristys_app/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class PostCard extends StatefulWidget {

  PostCard({
    this.post,
    @required this.onCardClick,
    @required this.onStarClick,
  });

  final Post post;

  final VoidCallback onCardClick;
  final VoidCallback onStarClick;

  @override
  State<StatefulWidget> createState() => new PostCardState();
}

class PostCardState extends State<PostCard> {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.onCardClick,
      child: new Card(
        elevation: 8.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.network(widget.post.imgURL),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.post.date),
                  SizedBox(height: 8.0),
                  Text(widget.post.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
