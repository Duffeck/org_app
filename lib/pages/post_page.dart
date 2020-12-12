import 'package:flutter/material.dart';
import 'package:org_app/components/post.dart';
import 'package:org_app/model/post.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTheme = Theme.of(context).textTheme.headline6;
    final TextStyle summaryTheme = Theme.of(context).textTheme.bodyText2;
    final Post post = ModalRoute.of(context).settings.arguments;

    return AspectRatio(
      aspectRatio: 5 / 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Post"),
          backgroundColor: Colors.green[600],
          automaticallyImplyLeading: true,
        ),
        body: ListView(children: <Widget>[
          SizedBox(height: 5),
          Center(
            child: Text(
              post.title,
              style: titleTheme,
            ),
          ),
          SizedBox(height: 5),
          PostImage(post),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(post.content, style: summaryTheme),
            ],
          ),
          /*Center(
            child: Row(
              children: <Widget>[
                SizedBox(height: 10),
                PostImage(post),
              ],
            ),
          ),*/
          SizedBox(height: 10),
          //PostTitleAndSummary()
        ]),
      ),
    );
  }
}
