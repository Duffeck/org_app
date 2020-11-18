import 'package:flutter/cupertino.dart';
import 'package:org_app/pages/feed.dart';
import 'package:org_app/pages/login.dart';
import 'package:org_app/pages/post_page.dart';
import 'package:org_app/pages/signup.dart';

class AppRoutes {
  static const LOGIN = '/';
  static const HOME = '/home';
  static const REGISTER_PAGE = '/register';
  static const FEED = '/feed';
  static const POST = '/post';
  /*static const GENIUS = '/genius';
  static const FART = '/fart';*/

  static Map<String, WidgetBuilder> rotas({appTitle: String}) {
    return {
      AppRoutes.LOGIN: (_) => LoginPage(title: appTitle),
      AppRoutes.REGISTER_PAGE: (_) => SignUpPage(title: appTitle),
      AppRoutes.FEED: (_) => Feed(),
      AppRoutes.POST: (_) => PostPage(),
      /*AppRoutes.XYLOPHONE: (_) => XylophoneApp(),
        AppRoutes.GENIUS: (_) => Genius(),
        AppRoutes.FART: (_) => RandomFart(),*/
    };
  }
}
