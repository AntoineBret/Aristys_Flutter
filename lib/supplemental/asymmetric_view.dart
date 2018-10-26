import 'package:flutter/material.dart';

import '../model/post.dart';
import 'posts_columns.dart';

class AsymmetricView extends StatelessWidget {
  final List<Post> postList;

  AsymmetricView({Key key, this.postList});

  List<Container> _buildColumns(BuildContext context) {
    if (postList == null || postList.isEmpty) {
      return <Container>[];
    }

    return List.generate(_listItemCount(postList.length), (int index) {
      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases
        int bottom = _evenCasesIndex(index);
        column = TwoPostCardColumn(
            bottom: postList[bottom],
            top: postList.length - 1 >= bottom + 1
                ? postList[bottom + 1]
                : null);
        width += 32.0;
      } else {
        /// Odd cases
        column = OnePostCardColumn(
          post: postList[_oddCasesIndex(index)],
        );
      }
      return Container(
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    }).toList();
  }

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      children: _buildColumns(context),
    );
  }
}
