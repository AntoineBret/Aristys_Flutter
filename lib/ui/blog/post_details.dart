import 'package:aristys_app/model/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  PostDetailsPage(this.post);

  final Post post;

  @override
  State<StatefulWidget> createState() => new _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test"),
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                widget.post.content,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
