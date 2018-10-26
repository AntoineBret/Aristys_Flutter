import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
    'https://public-api.wordpress.com/rest/v1.1/sites/blogaristysweb.wordpress.com/posts/';
  List data = [];

  Future<String> makeRequest() async {
    var response = await http
      .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["posts"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Blog'),
      ),
      body: new StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: data.length,
        itemBuilder: (BuildContext context, i) {
          new GestureDetector();
          return new Card(
            elevation: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.network(data[i]["featured_image"]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data[i]["date"]),
                      SizedBox(height: 8.0),
                      Text(data[i]["title"]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ));
  }
}

class SecondPage extends StatelessWidget {
  SecondPage(this.data);

  final data;

  @override
  Widget build(BuildContext context) =>
    new Scaffold(
      appBar: new AppBar(title: new Text('Second Page')),
      body: new Center(
        child: new Container(
          width: 150.0,
          height: 150.0,
          decoration: new BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
              image: new NetworkImage(data["featured_image"]),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
            border: new Border.all(
              color: Colors.red,
              width: 4.0,
            ),
          ),
        ),
      ));
}

//onTap: () {
//Navigator.push(
//context,
//new MaterialPageRoute(
//builder: (BuildContext context) =>
//new SecondPage(data[i])));
//},
