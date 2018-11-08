import 'package:aristys_app/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
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
    final ThemeData theme = Theme.of(context);

    return new GestureDetector(
      onTap: widget.onCardClick,
      child: new Card(
        elevation: 8.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 28.0 / 11.0,
              child: Image.network(widget.post.imgURL),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      _getDateFormatted(widget.post.date),
                    style: theme.textTheme.subtitle,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                      _parseHtmlString(widget.post.title),
                    style: theme.textTheme.title,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _parseHtmlString(String htmlString) {
  var document = parse(htmlString);
  String parsedString = parse(document.body.text).documentElement.text;
  return parsedString;
}

String _getDateFormatted(String dateString) {
  String dateLocalString = "";
  DateTime date = DateTime.parse(dateString);
  DateFormat dfLocal = new DateFormat("yMd");
  dateLocalString = dfLocal.format(date);
  return dateLocalString;
}
