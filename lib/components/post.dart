import 'package:flutter/material.dart';
//import 'package:org_app/pages/feed.dart';
class DemoValues {
  static final String userImage = "assets/images/user.png";
  static final String postImage = "assets/images/caridade.jpg";
  static final String userName = "Lucas";
  static final String userEmail = "lucasduffeck@gmail.com";
  static final String postTime = "27 Outubro, 2020";
  static final String postTitle = "Bom dia";
  static final String postSummary = "Testeeeeeeeeeeeeeeeeeee\nsummary";
}

class Post extends StatelessWidget {
  const Post({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: <Widget>[PostImage(), PostTitleAndSummary()],
      ),
    );
  }
}

class PostTitleAndSummary extends StatelessWidget {
  const PostTitleAndSummary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTheme = Theme.of(context).textTheme.headline6;
    final TextStyle summaryTheme = Theme.of(context).textTheme.bodyText2;
    final String title = DemoValues.postTitle;
    final String summary = DemoValues.postSummary;

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title, style: titleTheme),
          Text(summary, style: summaryTheme),
        ],
      ),
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2, child: Image.asset(DemoValues.postImage));
  }
}
