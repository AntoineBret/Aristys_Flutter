import 'package:aristys_app/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

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
        title: new Text(widget.post.title),
        backgroundColor: Colors.blue,
        elevation: 1.0,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: new SingleChildScrollView(
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Center(
            child: new MarkdownBody(
                data: html2md.convert(widget.post.content)
            ),
          ),
        ),
      ),
    );
  }
}
