import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:org_app/model/post.dart';
import 'dart:developer' as developer;

class Posts with ChangeNotifier {
  static const _baseUrl = 'https://org-app-b0d48.firebaseio.com/';
  /*final Map<String, Post> _itens = {
    '1': Post(
        id: 1,
        imageURL: 'asdasd',
        title: 'Título 1',
        content: 'Este é um texto comum com o conteúdo do post 1 :D'),
    '2': Post(
        id: 2,
        imageURL: 'asdasd',
        title: 'Título 2',
        content: 'Este é um texto comum com o conteúdo do post 2 :D'),
    '3': Post(
        id: 3,
        imageURL: 'asdasd',
        title: 'Título 3',
        content: 'Este é um texto comum com o conteúdo do post 3 :D'),
    '4': Post(
        id: 4,
        imageURL: 'asdasd',
        title: 'Título 4',
        content: 'Este é um texto comum com o conteúdo do post 4 :D'),
    '5': Post(
        id: 5,
        imageURL: 'asdasd',
        title: 'Título 5',
        content: 'Este é um texto comum com o conteúdo do post 5 :D'),
    '6': Post(
        id: 6,
        imageURL: 'asdasd',
        title: 'Título 6',
        content: 'Este é um texto comum com o conteúdo do post 6 :D'),
    '7': Post(
        id: 7,
        imageURL: 'asdasd',
        title: 'Título 7',
        content: 'Este é um texto comum com o conteúdo do post 7 :D'),
    '8': Post(
        id: 8,
        imageURL: 'asdasd',
        title: 'Título 8',
        content: 'Este é um texto comum com o conteúdo do post 8 :D'),
    '9': Post(
        id: 9,
        imageURL: 'asdasd',
        title: 'Título 9',
        content: 'Este é um texto comum com o conteúdo do post 9 :D'),
    '10': Post(
        id: 10,
        imageURL: 'asdasd',
        title: 'Título 10',
        content: 'Este é um texto comum com o conteúdo do post 10 :D'),
  };*/

  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  //CollectionReference users = FirebaseFirestore.instance.collection('users');

  /*List<Post> get all {
    //return this.fetchPosts();
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Post byIndex(int i) {
    return _itens.values.elementAt(i);
  }*/

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(_baseUrl + 'posts.json');

    var teste2 = _baseUrl + 'posts.json';
    developer.log(teste2);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //var resposta = jsonDecode(response.body);
      var map = Map.from(jsonDecode(response.body));
      developer.log(map.toString());
      var list = List<Post>();

      for (var v in map.values) {
        //var post = jsonDecode(v.toString());
        //developer.log(jsonDecode(v.toString()));
        developer.log(v["id"].toString());
        list.add(
          Post.fromJson(v),
        );
      }
      /*for (var i = 0; i < map.length; i++) {
        var post = jsonDecode(map[i]);
        developer.log(post.toString());
      }*/
      /*list.add(Post(
          id: v.id, imageURL: v.imageURL, title: v.title, content: v.content))*/
      //developer.log('aaaaaaaaaaaaaaaa: $list');
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Erro ao recuperar itens');
    }
  }
}
