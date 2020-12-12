import 'package:flutter/material.dart';
import 'package:org_app/components/post.dart';
import 'package:org_app/model/post.dart';
import 'package:org_app/providers/posts.dart';
import 'package:org_app/rotas/app_routes.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as developer;

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.POST);
      },
      child: AspectRatio(
        aspectRatio: 5 / 2,
        child: Card(
          child: Column(children: <Widget>[
            PostComponent(post),
            SizedBox(height: 10),
            _PostDetails(post)
          ]),
        ),
      ),
    );
  }
}

class _PostDetails extends StatelessWidget {
  final Post post;
  const _PostDetails(this.post);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 5.0,
        ),
        _UserImage(),
        SizedBox(
          width: 5.0,
        ),
        _UserNameAndEmail()
      ],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DemoValues.userName),
          Text(DemoValues.userEmail),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        backgroundImage: AssetImage(DemoValues.userImage),
      ),
    );
  }
}

/*class Feed extends StatelessWidget {
  //const Feed({Key key}) : super(key: key);

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final Posts posts = Provider.of(context);
    var teste = posts.fetchPosts();

    developer.log('log me: $teste');
    return Scaffold(
      //appBar: AppBar(
      //  title: Text("Org App"),
      //),
      backgroundColor: Colors.green[600],
      body: ListView.builder(
        itemCount: posts.count,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(posts.byIndex(index));
        },
      ),
    );
  }
}*/

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    final Posts posts = Provider.of(context, listen: false);
    futurePost = posts.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            //appBar: AppBar(
            //  title: Text("Org App"),
            //),
            backgroundColor: Colors.green[600],
            body: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return PostCard(snapshot.data[index]);
              },
            ),
          );
        } else if (snapshot.hasError) {
          developer.log(snapshot.error.toString());
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );

    /*return Scaffold(
      //appBar: AppBar(
      //  title: Text("Org App"),
      //),
      backgroundColor: Colors.green[600],
      body: ListView.builder(
        itemCount: posts.count,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(posts.byIndex(index));
        },
      ),
    );*/
  }
}
