import 'package:flutter/material.dart';
import 'package:org_app/components/post.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Post"),
          backgroundColor: Colors.green[600],
          automaticallyImplyLeading: false,
        ),
        body: Column(children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: PostImage(),
          ),
          SizedBox(height: 10),
          PostTitleAndSummary()
        ]),
      ),
    );
  }
}
