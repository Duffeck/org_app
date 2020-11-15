import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:org_app/model/user.dart';

class Users with ChangeNotifier {
  //static const _baseUrl = 'https://teste-fba6d.firebaseio.com/';
  static const _baseUrl = 'https://org-app-b0d48.firebaseio.com/';
  final Map<String, User> _itens = {};
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  //CollectionReference users = FirebaseFirestore.instance.collection('users');

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  Future<void> put(User user) async {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      //_itens.update(user.id, (_) => user);
      _itens.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final response = await http.post(
        "$_baseUrl/users.json",
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );
      final id = json.decode(response.body)['name'];
      print(json.decode(response.body));
      _itens.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }

  remove(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
      notifyListeners();
    }
  }

  Future<String> login(String email, String pasword) async {
    if (email == null || pasword == null) {
      return '';
    }

    var response = await http.get(Uri.encodeFull("$_baseUrl/users"));

    print(response);

    return response.body.toString();

    //developer.log(users.doc().get().toString(), name: 'my.app.category');

    /* if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      //_itens.update(user.id, (_) => user);
      _itens.update(
          user.id,
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      final response = await http.post(
        "$_baseUrl/users.json",
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarUrl': user.avatarUrl,
        }),
      );
      final id = json.decode(response.body)['name'];
      print(json.decode(response.body));
      _itens.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }*/

    notifyListeners();
  }
}
