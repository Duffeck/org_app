import 'package:flutter/material.dart';

class Post {
  final int id;
  final String imageURL;
  final String title;
  final String content;

  const Post({
    this.id,
    this.imageURL,
    @required this.title,
    @required this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      imageURL: json['imageURL'],
      title: json['title'],
      content: json['content'],
    );
  }
}
