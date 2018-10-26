import 'package:flutter/material.dart';

import '../model/post.dart';
import 'post_card.dart';

class TwoPostCardColumn extends StatelessWidget {
  TwoPostCardColumn({
    this.bottom,
    this.top,
  }) : assert(bottom != null);

  final Post bottom, top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const spacerHeight = 44.0;

          double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
          double heightOfImages = heightOfCards - PostCard.kTextBoxHeight;
          // TODO: Change imageAspectRatio calculation (104)
          double imageAspectRatio = constraints.biggest.width / heightOfImages;

          // TODO: Replace Column with a ListView (104)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.only(start: 28.0),
                child: top != null
                    ? PostCard(
                  imageAspectRatio: imageAspectRatio,
                  post: top,
                )
                    : SizedBox(
                  height: heightOfCards,
                ),
              ),
              SizedBox(height: spacerHeight),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 28.0),
                child: PostCard(
                  imageAspectRatio: imageAspectRatio,
                  post: bottom,
                ),
              ),
            ],
          );
        });
  }
}

class OnePostCardColumn extends StatelessWidget {
  OnePostCardColumn({this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace Column with a ListView (104)
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        PostCard(
          post: post,
        ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
